#!/usr/bin/env bash

## Patch and install necessary packages. Source it
## in .zshrc/.bashrc or run after a system reboot

TMPFILE='/tmp/syspatch.tmp'
BACKUPDIR='full path of directory with your backup k3s binary'

## If you are using the system-upgrade-controller you will need to back up
## the current binary somewhere for restore after a truenas update because it will get over-written
if [[ $(sha256sum /usr/local/bin/k3s |cut -d' ' -f1) != "c257e119158feee992dc4397be00490103f0dde5af4b014e8d0f17f9db35ef00" ]]; then
    cp "${BACKUPDIR}"/k3s /usr/local/bin/.
    chmod +x /usr/local/bin/k3s
    touch "${TMPFILE}"
    echo "k3s has been updated"
  else
    echo "k3s is already current"
fi

## Patch k3s config and prevent it from being over-written on restarts
## it still will be over-written after an update
if ! grep -q servicelb /etc/rancher/k3s/config.yaml; then
cat <<- 'EOF' >> /etc/rancher/k3s/config.yaml
kubelet-arg:
- feature-gates=GracefulNodeShutdown=true
- feature-gates=MixedProtocolLBService=true
flannel-backend: "none"
disable:
- flannel
- traefik
- servicelb
- metrics-server
- local-storage
disable-network-policy: true
disable-cloud-controller: true
disable-kube-proxy: true
EOF
    echo "k3s config patched"
    chattr +i /etc/rancher/k3s/config.yaml
    touch "${TMPFILE}"
  else
    echo "k3s config already patched"
fi

## Only restart k3s service if tmp file present
## from a patch above
if [[ -f "${TMPFILE}" ]]; then
    systemctl restart k3s.service
    rm "${TMPFILE}"
fi

## install current kubectl
if [[ ! -f /usr/local/bin/kubectl ]]; then
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
    mv kubectl /usr/local/bin/.
    chmod +x /usr/local/bin/kubectl
  else
    echo "kubectl already installed"
fi

## install kustomize
if [[ ! -f /usr/local/bin/kustomize ]]; then
    curl -sL "https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh" | bash
    mv kustomize /usr/local/bin/.
    chmod +x /usr/local/bin/kustomize
  else
    echo "kustomize already installed"
fi

# install flux
if [[ ! -f /usr/local/bin/flux ]]; then
    curl -sL "https://fluxcd.io/install.sh" | bash
  else
    echo "flux already installed"
fi

## install sops
if ! dpkg-query -s sops | grep -q 'install ok installed'; then
    curl -sL "https://github.com/mozilla/sops/releases/download/v3.7.1/sops_3.7.1_amd64.deb" -o /tmp/sops.deb
    dpkg -i /tmp/sops.deb
  else
    echo "sops already installed"
fi

### Optional ###

## If you want to access k3s from your lan and not have to
## ssh in every time you need to update iptables. kube-router must be
## running first to prevent a race condition with truenas middleware
until systemctl status kube-router.service | grep -q "active (running)"; do
    echo "waiting for kube-router to start"
    sleep 1
done

## For good measure ##
sleep 15

## First run iptables -L INPUT to make sure you have right rule number
## In this example the ip address of the truenas server is 192.168.1.10
## and the iptables rule number is 4. Adjust for your scenario.
if iptables -L INPUT | grep -q '192.168.1.10/32'; then
    iptables -R INPUT 4 -s 192.168.1.0/24 -j ACCEPT -p tcp --dport 6443
    echo "iptables patched"
  else
    echo "iptables already patched"
fi

#!/usr/bin/env bash

# Patch and install necessary packages. Source it in .zshrc/.bashrc or run
# periodically with a cronjob as this will not persist through a system upgrade.                                                                                                                                                                                            

## add feature flags
if ! grep -q servicelb /etc/rancher/k3s/config.yaml; then
cat <<- 'EOF' >> /etc/rancher/k3s/config.yaml
kubelet-arg:
- "feature-gates=GracefulNodeShutdown=true"
- "feature-gates=MixedProtocolLBService=true"
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
    systemctl daemon-reload
    systemctl restart k3s.service
  else
    echo "k3s config already patched"
fi

# kustomize
if [[ ! -f /usr/local/bin/kustomize ]]; then
    curl -sL "https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh" | bash
    mv kustomize /usr/local/bin/.
  else
    echo "kustomize already installed"
fi

# flux
if [[ ! -f /usr/local/bin/flux ]]; then
    curl -sL "https://fluxcd.io/install.sh" | bash
  else
    echo "flux already installed"
fi

# sops
if ! dpkg-query -s sops | grep -q 'install ok installed'; then
    curl -sL "https://github.com/mozilla/sops/releases/download/v3.7.1/sops_3.7.1_amd64.deb" -o /tmp/sops.deb
    dpkg -i /tmp/sops.deb
  else
    echo "sops already installed"
fi

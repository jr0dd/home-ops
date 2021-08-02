#!/usr/bin/env bash

# Patch and install necessary packages. Source it in .zshrc/.bashrc or run
# periodically with a cronjob as this will not persist through a system upgrade.                                                                                                                                                                                            

# lb fix
if ! grep -q 'servicelb' /lib/systemd/system/k3s.service; then
    sed -i 's/\(disable=\)/\1servicelb,/' /lib/systemd/system/k3s.service
    echo "servicelb patched"
    touch /tmp/syspatch
  else
    echo "servicelb already patched"
fi

# coredns fix
if ! grep -q 'coredns' /lib/systemd/system/k3s.service; then
    sed -i 's/\(disable=\)/\1coredns,/' /lib/systemd/system/k3s.service
    echo "coredns patched"
    touch /tmp/syspatch
  else
    echo "coredns already patched"
fi

if [[ -f /tmp/syspatch ]]; then
    echo "restarting daemon"
    systemctl daemon-reload
    systemctl restart k3s.service
    rm /tmp/syspatch
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
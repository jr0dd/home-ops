# k8s-gitops
First off this would not exist if it wasn't for k8s@home check out this repo to get started:
https://github.com/k8s-at-home/template-cluster-k3s


If you try loading this on TrueNAS just be prepared that in the future this may not work!
SCALE is still beta and there is no telling what IX-Systems might neuter in the future
as far as K3S goes. Their middleware forces the zfs-operator to be deployed after every reboot
If the file is missing it gets re-created. Using `chattr` on the file breaks k3s, so for now 
sticking with their install of zfs-operator over helm install.

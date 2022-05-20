#!/bin/bash

source <(kubectl completion bash)
kubectl apply -f pod.yaml
export IP=$(curl https://ipinfo.io/ip)
export API_SERVER=https://$IP:6443

# 01_kubelet
# cat /etc/systemd/system/kubelet.service.d/10-kubeadm.conf
# vi /var/lib/kubelet/config.yaml
# change authentication
# change authorization
# systemctl daemon-reload
# systemctl restart kubelet
# systemctl status kubelet

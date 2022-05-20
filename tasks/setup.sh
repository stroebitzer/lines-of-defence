#!/bin/bash

# 01_kubelet
# cat /etc/systemd/system/kubelet.service.d/10-kubeadm.conf
# vi /var/lib/kubelet/config.yaml
# change authentication
# change authorization
# systemctl daemon-reload
# systemctl restart kubelet
# systemctl status kubelet

echo "Patching API Server"
mkdir /root/apiserver
mkdir /root/tmp
sed  '/  volumes:/a \
  - name: lod-apiserver\
    hostPath:\
      path: /root/apiserver\
      type: DirectoryOrCreate' /etc/kubernetes/manifests/kube-apiserver.yaml > /root/tmp/apiserver-1.yaml
sed  '/  volumeMounts:/a \
    - name: lod-apiserver\
      mountPath: /apiserver' /root/tmp/apiserver-1.yaml > /root/tmp/apiserver-2.yaml
mv /root/tmp/apiserver-2.yaml /etc/kubernetes/manifests/kube-apiserver.yaml

echo "Misc stuff"
source <(kubectl completion bash)
kubectl apply -f pod.yaml
export IP=$(curl https://ipinfo.io/ip)
export API_SERVER=https://$IP:6443
PS1="$ "

echo "Finished successfuly"

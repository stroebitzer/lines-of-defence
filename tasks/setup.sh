#!/bin/bash

# systemctl daemon-reload
# systemctl restart kubelet
# systemctl status kubelet

echo "Patching Kubelet"
mkdir /root/tmp
sed  's/    enabled: false/    enabled: true/g' /var/lib/kubelet/config.yaml > /root/tmp/kubelet-1.yaml
sed  's/  mode: Webhook/  mode: AlwaysAllow/g' /root/tmp/kubelet-1.yaml > /root/tmp/kubelet-2.yaml
mv /root/tmp/kubelet-2.yaml /var/lib/kubelet/config.yaml
systemctl daemon-reload
systemctl restart kubelet
systemctl status kubelet

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

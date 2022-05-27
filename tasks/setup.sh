#!/bin/bash

# systemctl daemon-reload
# systemctl restart kubelet
# systemctl status kubelet

echo "Setup Script Patching Kubelet"
mkdir /root/tmp
sed  's/    enabled: false/    enabled: true/g' /var/lib/kubelet/config.yaml > /root/tmp/kubelet-1.yaml
sed  's/  mode: Webhook/  mode: AlwaysAllow/g' /root/tmp/kubelet-1.yaml > /root/tmp/kubelet-2.yaml
mv /root/tmp/kubelet-2.yaml /var/lib/kubelet/config.yaml
systemctl daemon-reload
systemctl restart kubelet
# systemctl status kubelet

echo "Setup Script Patching API Server"
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


# MANUAL STEPS
# export IP=$(curl https://ipinfo.io/ip)
# export API_SERVER=https://$IP:6443
# PS1="$ "
# source <(kubectl completion bash)
# export ETCDCTL_API=3
# export ETCDCTL_ENDPOINTS=https://127.0.0.1:2379
# export ETCDCTL_CACERT=/etc/kubernetes/pki/etcd/ca.crt
# export ETCDCTL_KEY=/etc/kubernetes/pki/etcd/server.key
# export ETCDCTL_CERT=/etc/kubernetes/pki/etcd/server.crt
# kubectl apply -f /root/lines-of-defence/tasks/pod.yaml
# kubectl create clusterrolebinding my-suboptimal-clusterrolebinding --clusterrole=cluster-admin --serviceaccount default:default

echo "Setup Script Finished Successfuly"

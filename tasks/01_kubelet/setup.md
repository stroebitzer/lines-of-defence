# unfix kubelet config

cat /etc/systemd/system/kubelet.service.d/10-kubeadm.conf

vi /var/lib/kubelet/config.yaml
change authentication
change authorization
systemctl daemon-reload
systemctl restart kubelet
systemctl status kubelet

# apply privileged pod
kubectl apply -f pod.yaml

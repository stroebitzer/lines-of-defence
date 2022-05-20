
# kubernetes services

ls -alh /etc/kubernetes/pki/

cat /etc/kubernetes/kubelet.conf

kubeadm certs check-expiration

kubeadm certs renew --help

openssl x509 -in /etc/kubernetes/pki/apiserver.crt -text -noout


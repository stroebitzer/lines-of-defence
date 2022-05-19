
# inspect etcd
cat /etc/kubernetes/manifests/etcd.yaml 
cd /var/lib/etcd/

kubectl create secret generic my-secret --from-literal my-password-1=password123

# check secret is in plain text
etcdctl \
  --endpoints=https://127.0.0.1:2379  \
  --cacert=/etc/kubernetes/pki/etcd/ca.crt \
  --cert=/etc/kubernetes/pki/etcd/server.crt \
  --key=/etc/kubernetes/pki/etcd/server.key \
      get /registry/secrets/default/my-secret

# backup
etcdctl \
  --endpoints=https://127.0.0.1:2379  \
  --cacert=/etc/kubernetes/pki/etcd/ca.crt \
  --cert=/etc/kubernetes/pki/etcd/server.crt \
  --key=/etc/kubernetes/pki/etcd/server.key \
      snapshot save snap.db

cat snap.db | grep -a my-secret


# implement encryption at rest

## customize encryption-provider-config

kubectl create secret generic my-secret --from-literal password2=password123

# check secret is in plain text

# backup check

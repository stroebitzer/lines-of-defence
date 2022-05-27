
# inspect etcd
cat /etc/kubernetes/manifests/etcd.yaml 
ls -alh /var/lib/etcd/

kubectl create secret generic my-secret --from-literal my-password-1=password123

<!-- TODO use envvars to make etcdctl nicer??? -->

# check secret is in plain text
etcdctl \
  --endpoints=https://127.0.0.1:2379  \
  --cacert=/etc/kubernetes/pki/etcd/ca.crt \
  --cert=/etc/kubernetes/pki/etcd/server.crt \
  --key=/etc/kubernetes/pki/etcd/server.key \
      get /registry/secrets/default/my-secret

# implement encryption at rest

# customize encryption-provider-config

take a look at encryption config => PW and resource types
<!-- TODO add this to the slides -->

cp /root/lines-of-defence/tasks/06_encryption_at_rest/encryption-config.yaml /root/apiserver

--encryption-provider-config=/apiserver/encryption-config.yaml

# check encryption => expected fail

etcdctl \
  --endpoints=https://127.0.0.1:2379  \
  --cacert=/etc/kubernetes/pki/etcd/ca.crt \
  --cert=/etc/kubernetes/pki/etcd/server.crt \
  --key=/etc/kubernetes/pki/etcd/server.key \
      get /registry/secrets/default/my-secret

kubectl create secret generic my-secret-2 --from-literal password2=password456

...etcd my-secret-2

# encrypt all existing secrets
kubectl get secrets --all-namespaces -o json | kubectl replace -f -

...etcd my-secret
# backup
etcdctl \
  --endpoints=https://127.0.0.1:2379  \
  --cacert=/etc/kubernetes/pki/etcd/ca.crt \
  --cert=/etc/kubernetes/pki/etcd/server.crt \
  --key=/etc/kubernetes/pki/etcd/server.key \
      snapshot save backup.db

cat backup.db | grep -a password123

cat backup.db | grep -a password456

# fix old data in backup

etcdctl --write-out=table snapshot status backup.db

etcdctl \
  --endpoints=https://127.0.0.1:2379  \
  --cacert=/etc/kubernetes/pki/etcd/ca.crt \
  --cert=/etc/kubernetes/pki/etcd/server.crt \
  --key=/etc/kubernetes/pki/etcd/server.key \
  compact 33864

... create backup again

cat backup.db | grep -a password123
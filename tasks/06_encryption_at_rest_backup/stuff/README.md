# backup
etcdctl snapshot save backup.db

cat backup.db | grep -a password123

cat backup.db | grep -a password456

# fix old data in backup

etcdctl --write-out=table snapshot status backup.db

etcdctl compact 33864

etcdctl snapshot save backup_compacted.db

etcdctl --write-out=table snapshot status backup_compacted.db

cat backup_compacted.db | grep -a password123

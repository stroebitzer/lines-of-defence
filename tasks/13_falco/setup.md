
# install on host

curl -s https://falco.org/repo/falcosecurity-3672BA8F.asc | apt-key add -
echo "deb https://download.falco.org/packages/deb stable main" | tee -a /etc/apt/sources.list.d/falcosecurity.list
apt-get update -y

apt-get -y install linux-headers-$(uname -r)

apt-get install -y falco

<!-- TODO check -->
systemctl enable falco
systemctl start falco
systemctl status falco

# configure falco

vi /etc/falco/falco.yaml

file_output:
  enabled: true
  keep_alive: false
  filename: /var/log/falco.txt

systemctl restart falco

# test it

tail -f /var/log/falco.txt

kubectl run nginx --image nginx
kubectl exec -it nginx -- bash
cat /etc/shadow
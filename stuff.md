# connect
hcloud context create lod

# get servers
hcloud server list

# delete server
hcloud server delete 20175552

# create server
hcloud server-type list
hcloud ssh-key list
hcloud server create --location nbg1 --name lod \
  --image ubuntu-20.04 --type cpx31 --ssh-key lod \
  --user-data-from-file ./cloudinit.yaml

# get lod server
hcloud server list -o noheader -o columns=id

# connect
IP=$(hcloud server list -o noheader -o columns=ipv4)
SSH_KEY_PATH=/home/hubert/Desktop/craft_conf/secrets/id_rsa
ssh -i $SSH_KEY_PATH root@$IP
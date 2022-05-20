
# check kubadm
cat /etc/kubernetes/manifests/kube-apiserver.yaml 

# create stuff
kubectl create clusterrole dev-user --verb=get,list,watch --resource=pods
kubectl create clusterrolebinding dev-user --clusterrole=dev-user --user=dev-user

# check permissions
kubectl auth can-i create deployments
kubectl auth can-i get deployments --as dev-user
kubectl auth can-i get pods --as dev-user 



# getting

kubectl exec -it my-pod -- cat /var/run/secrets/kubernetes.io/serviceaccount/token
kubectl exec -it my-pod -- cat /var/run/secrets/kubernetes.io/serviceaccount/ca.crt

TOKEN=$(kubectl exec -it my-pod -- cat /var/run/secrets/kubernetes.io/serviceaccount/token)
kubectl exec -it my-pod -- cat /var/run/secrets/kubernetes.io/serviceaccount/ca.crt > ca.crt

curl -s $API_SERVER/api/v1/namespaces/default/pods --header "Authorization: Bearer $TOKEN" --cacert ca.crt

=> pods is forbidden

kubectl create clusterrolebinding default --clusterrole=cluster-admin --serviceaccount default:default

curl -s $API_SERVER/api/v1/namespaces/default/pods --header "Authorization: Bearer $TOKEN" --cacert ca.crt

# check kubadm
cat /etc/kubernetes/manifests/kube-apiserver.yaml 

# create stuff
kubectl create clusterrole dev-user --verb=get,list,watch --resource=pods
kubectl create clusterrolebinding dev-user --clusterrole=dev-user --user=dev-user

# check permissions
kubectl auth can-i create deployments
kubectl auth can-i get deployments --as dev-user
kubectl auth can-i get pods --as dev-user 



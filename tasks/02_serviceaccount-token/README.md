
# getting

kubectl exec -it my-suboptimal-pod -- cat /var/run/secrets/kubernetes.io/serviceaccount/token
kubectl exec -it my-suboptimal-pod -- cat /var/run/secrets/kubernetes.io/serviceaccount/ca.crt

TOKEN=$(kubectl exec -it my-suboptimal-pod -- cat /var/run/secrets/kubernetes.io/serviceaccount/token)
kubectl exec -it my-suboptimal-pod -- cat /var/run/secrets/kubernetes.io/serviceaccount/ca.crt > ca.crt

curl -s $API_SERVER/api/v1/namespaces/default/pods --header "Authorization: Bearer $TOKEN" --cacert ca.crt

=> should work

kubectl get clusterrolebindings

=> check the default my-suboptimal-clusterrolebinding

kubectl delete clusterrolebinding my-suboptimal-clusterrolebinding

# check kubadm
cat /etc/kubernetes/manifests/kube-apiserver.yaml 

=> check authorization mode

# create stuff
kubectl create clusterrole dev-user --verb=get,list,watch --resource=pods
kubectl create clusterrolebinding dev-user --clusterrole=dev-user --user=dev-user

# check permissions
kubectl auth can-i create deployments
kubectl auth can-i get deployments --as dev-user
kubectl auth can-i get pods --as dev-user 



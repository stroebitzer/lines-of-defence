
# getting

kubectl exec -it my-privileged-pod -- cat /var/run/secrets/kubernetes.io/serviceaccount/token
kubectl exec -it my-privileged-pod -- cat /var/run/secrets/kubernetes.io/serviceaccount/ca.crt

TOKEN=$(kubectl exec -it my-privileged-pod -- cat /var/run/secrets/kubernetes.io/serviceaccount/token)
kubectl exec -it my-privileged-pod -- cat /var/run/secrets/kubernetes.io/serviceaccount/ca.crt > ca.crt

curl -s $API_SERVER/api/v1/namespaces/default/pods --header "Authorization: Bearer $TOKEN" --cacert ca.crt

=> pods is forbidden

kubectl create clusterrolebinding default --clusterrole=cluster-admin --serviceaccount default:default

curl -s $API_SERVER/api/v1/namespaces/default/pods --header "Authorization: Bearer $TOKEN" --cacert ca.crt

automountServiceAccountToken: false
make containers read only

securityContext:
  readOnlyRootFilesystem: true

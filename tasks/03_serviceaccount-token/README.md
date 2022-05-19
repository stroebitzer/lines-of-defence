kubectl exec -it my-privileged-pod -- cat /var/run/secrets/kubernetes.io/serviceaccount/token
kubectl exec -it my-privileged-pod -- cat /var/run/secrets/kubernetes.io/serviceaccount/ca.crt


TOKEN=$(kubectl exec -it my-privileged-pod -- cat /var/run/secrets/kubernetes.io/serviceaccount/token)
kubectl exec -it my-privileged-pod -- cat /var/run/secrets/kubernetes.io/serviceaccount/ca.crt > ca.crt

cat ~/.kube/config for apiserver url

curl -s https://116.203.41.138:6443/api/v1/namespaces/default/pods --header "Authorization: Bearer $TOKEN" --cacert ca.crt

=> pods is forbidden

kubectl create clusterrolebinding default --clusterrole=cluster-admin --serviceaccount default:default

curl -s https://116.203.41.138:6443/api/v1/namespaces/default/pods --header "Authorization: Bearer $TOKEN" --cacert ca.crt

automountServiceAccountToken: false
make containers read only

securityContext:
  readOnlyRootFilesystem: true

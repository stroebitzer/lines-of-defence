<!-- TODO where do the secrets come from, from a git repo??? -->

kubectl create secret generic my-secret --from-literal password=password123

kubectl get secret my-secret -o yaml
kubectl get secret my-secret -o jsonpath='{.data.password}' | base64 -d

kubectl apply -f pod.yaml

kubectl exec -it my-pod-using-secret -- ls -alh /secret/
kubectl exec -it my-pod-using-secret -- cat /secret/password

df | grep tmpfs
cat /var/lib/kubelet/pods/c61079ab-eed7-4f79-b87b-b01c62e54d70/volumes/kubernetes.io~secret/secret-data/password


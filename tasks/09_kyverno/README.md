# image registries
kubectl apply -f image-registry-cluster-policy.yaml
kubectl delete pod my-suboptimal-pod 
kubectl apply -f pod.yaml
=> expect error

kubectl delete -f image-registry-cluster-policy.yaml
kubectl apply -f pod.yaml
=> should work again




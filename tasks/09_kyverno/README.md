=> make pod privileged and allowPrivelegeEscalation again!!!

# non privileged containers
kubectl apply -f not-privileged-cluster-policy.yaml
kubectl delete pod my-suboptimal-pod 
kubectl apply -f pod.yaml
expect error

# image registries
kubectl apply -f image-registry-cluster-policy.yaml
kubectl delete pod my-suboptimal-pod 
kubectl apply -f pod.yaml
expect error

# cleanup
helm uninstall kyverno


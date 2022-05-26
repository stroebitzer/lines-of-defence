
# install
helm repo add kyverno https://kyverno.github.io/kyverno/
helm repo update
helm install kyverno kyverno/kyverno --version v2.3.3

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
kubens default


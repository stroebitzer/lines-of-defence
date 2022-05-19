helm install kyverno kyverno/kyverno -n kyverno --create-namespace --version v2.3.3

kubens kyverno

# non privileged containers
create not-privileged-cluster-policy.yaml
kubectl apply -f pod.yaml
expect error

# image registries
create image-registry-cluster-policy.yaml
kubectl apply -f pod.yaml
expect error

# cleanup
helm uninstall kyverno
kubens default


<!-- TODO maybe do all in the default namespace -->
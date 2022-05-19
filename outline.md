
# Basics
Firewalls, Passwords, Users, Permissions, Secrets, Git Secrets, encryption on 3 levels
exposing worker nodes
doing tls everywhere => Istio

# Keeping evil guy outside the castle
Trivy => image Scanner
ImagePolicyWebhook

# Avoiding people doing wrong stuff inside of the castle
NetworkPolicy => firewall inside Kubernetes
kubesec => manifest scanner
Kyverno / OPA / PSP => more checking of stuff

# Bad guy is in castle, making infra safer
Seccomp, AppArmor, 

# Bad guy is in castle, wrap him, sandboxing
gvisor, kata

# Having spies everywhere
Falco - Monitors Syscalls
Auditing

# Benchmarking the castle
kube-bench => the cluster itself
kube hunter => the workloads?

# Misc
having readonly pods
no token mounted in pods


 

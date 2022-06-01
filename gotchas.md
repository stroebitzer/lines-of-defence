do a proper firewall

you need automation for this madness

# kubelet
Do not expose kubelet to internet (= firewall)
Check authentication and authorization config of kubelet
You have to have a valid reason for running privileged containers
You have to have a valid reason for running containers as root user
Sandbox containers

# rbac
Only grant access to clusters towards trustworthy persons
Make use of a Firewall
Least privilege principle
Make use of securityContext flag readOnlyRootFilesystem
Mount volumes read-only whenever possible

Only grant access to clusters towards trustworthy persons
Make use of a Firewall
Least privilege principle
Make use of pod flag automountServiceAccountToken


# encryption at usage
Care about who has access to pods or worker nodes
Make use of Hashicorp Vault or the Secret Store CSI Driver
Encrypt your secrets in your git repos eg via Mozilla Sops or GitCrypt

# encryption at transport
Update ControlPlane Certs on a regular basis
Make use of a ServiceMesh for doing Application to Application encryption

# encryption at rest
Do encryption in etcd
Encrypt all already existing secrets after you engaged encryption
Compact data after you engaged encryption
Delete all existing backups with plaintext secrets in it
Make sure backups are stored safe
Rotate the encryption key

# Image Scanning
Add Image Scanner to your Delivery Pipeline
Use a tool which scans dependencies of applications
Do not put ANY sensitive data into your images

GitOps Tools allow you do an abstraction of Kubernetes auth questions
Kubernetes Users auth questions are answered by the Git Repo

# kyverno
Validating Webhooks have no effect on already existing Pods
PSPs are deprecated
OPA Gatekeeper involves learning a new language, called Rego
Kyverno supports to modes: enforce or audit
ImagePolicyWebhooks can also be used for limiting allowed registries


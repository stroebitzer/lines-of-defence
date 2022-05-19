# Session Title
Lines of Defence – Securing Your Kubernetes Clusters

# Elevator Pitch

Log4shell showed us again how volatile our stacks are. Building complex systems based on Open Source Tools is awesome but we have to shrink the attack vector on those systems. Let's take a look how we can make our Kubernetes Clusters more safe.

# Description

As we migrate more and more workloads into our Kubernetes clusters we ask ourselves: How can we make our clusters safe from vicious attacks? In this talk, Hubert will present tools which make it harder for attackers to do bad things on your clusters. Topics covered will include scanning of Images and Manifests, building gates before applications get deployed, sandboxing applications and Threat Detection. You will learn how to ensure that you are in control of what is running in your clusters. Of course, via live demos.

# Benefits to the Ecosystem

As the adoption of Kubernetes rises, more and more attackers add Kubernetes to their target list. Against this background, Kubernetes administrators need to develop a solid understanding of how to make their clusters safe. On the one hand, they have to protect their environments. On the other hand the Kubernetes project itself absolutely has no  interest in having bad media coverage like the log4j project currently has.

Luckily, there are a lot of great open source tools and Kubernetes configuration possibilities out there which can help Kubernetes Administrators on these tasks. In this talk, Hubert wants to put the spotlight on these tools and show how easy you can make use of them. 

Hubert will cover the following tools:
* trivy, kubesec, kube-bench, ImagePolicyWebhooks
* Container sandboxes: seccomp, AppArmor, gvisor, Kata Containers
* Threat Detection tools: Falco, Kubernetes Auditing


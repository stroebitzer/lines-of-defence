

kubectl apply -f my-pod.yaml

kubectl expose pod my-pod --type NodePort

ip a | grep inet
<!-- TODO store public IP at the beginning into envvar -->

<!-- TODO naming of things and labeling is ugly -->

kubectl get svc

=> visit nginx in browser

kubectl run caller --rm -it --image nicolaka/netshoot

kubectl run caller --rm -it --labels app=caller --image nicolaka/netshoot

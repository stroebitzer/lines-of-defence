
# problem

kubectl exec -it my-pod -- touch /some-file.txt
kubectl exec -it my-pod -- ls -alh /some-file.txt

# fix it

securityContext:
  readOnlyRootFilesystem: true

kubectl exec -it my-pod -- touch /some-file.txt

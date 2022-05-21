
# problem

kubectl exec -it my-suboptimal-pod -- touch /some-file.txt
kubectl exec -it my-suboptimal-pod -- ls -alh /some-file.txt

# fix it

securityContext:
  readOnlyRootFilesystem: true

kubectl exec -it my-suboptimal-pod -- touch /some-file.txt

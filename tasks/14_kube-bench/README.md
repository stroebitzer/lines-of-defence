# kubebench
```
kubectl apply -f https://raw.githubusercontent.com/aquasecurity/kube-bench/main/job.yaml
kubectl logs -f <KUBE_BENCH_POD>
kubectl logs -f <KUBE_BENCH_POD> | grep FAIL
```

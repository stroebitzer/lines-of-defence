
=> ensure that pod is allowed to write again (kyverno and pod.yaml)
kubectl exec my-suboptimal-pod -- touch /tmp/some.file

# check installation
systemctl status apparmor

# check apparmor is enabled
cat /sys/module/apparmor/parameters/enabled

# see status of apparmor - see all loaded profiles
aa-status

# default profiles directory
ls -alh /etc/apparmor.d/

=> mv 11_apparmor/my-apparmor-profile /etc/apparmor.d/
systemctl restart apparmor

# make use of apparmor in pod

=> engage apparmor annotation

kubectl exec my-suboptimal-pod -- touch /tmp/some.file
=> error

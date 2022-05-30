
=> ensure that pod is allowed to write again

<!-- TODO make a better example for this - dissallow writing everywhere some kind of sucks -->

# check installation
systemctl status apparmor

# check apparmor is enabled
cat /sys/module/apparmor/parameters/enabled

# see status of apparmor - see all loaded profiles
aa-status

# default profiles directory
cat /etc/apparmor.d/

=> mv 11_apparmor/kubernetes /etc/apparmor.d/
systemctl restart apparmor

# make use of apparmor in pod

=> engage apparmor annotation

kubectl exec my-suboptimal-pod -- touch /tmp/some.file
=> error

# apparmor logging
aa-complain /etc/apparmor.d/kubernetes

cat /var/log/syslog | grep k8s-apparmor-deny-write


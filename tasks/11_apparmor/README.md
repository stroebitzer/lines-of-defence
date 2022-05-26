# check installation
systemctl status apparmor

# check apparmor is enabled
cat /sys/module/apparmor/parameters/enabled

# check profiles
cat /sys/kernel/security/apparmor/profiles

# see status of apparmor - see all loaded profiles
aa-status

# default profiles directory
cat /etc/apparmor.d/

=> mv 11_apparmor/kubernetes /etc/apparmor.d/

# load profile

<!-- TODO do I need to do this really? -->

apparmor_parser /etc/apparmor.d/kubernetes
=> if nothing is printed out the profile was loaded

# make use of apparmor in pod

... engage apparmor annotation

kubectl exec my-suboptimal-pod -- touch /tmp/some.file
=> error

# apparmor logging
aa-complain /etc/apparmor.d/kubernetes

<!-- https://wiki.debian.org/AppArmor/HowToUse#:~:text=AppArmor%20logs%20can%20be%20found,log%20when%20auditd%20is%20installed). -->
<!-- TODO not sure if apparmor is the reason for failing here-->
cat /var/log/syslog | grep k8s-apparmor-deny-write


# disable profile
apparmor_parser -R /etc/apparmor.d/kubernetes
# if nothing is printed out the profile was loaded
ln -s /etc/apparmor.d/root.add_data.sh /etc/apparmor.d/disable/

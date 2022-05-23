# check installation
systemctl status apparmor

# check apparmor is enabled
cat /sys/module/apparmor/parameters/enabled

# check profiles
cat /sys/kernel/security/apparmor/profiles

# see status of apparmor - see all loaded profiles
aa-status

# default profiles directory
/etc/apparmor.d/

create kubernetes apparmor file

# load profile
apparmor_parser /etc/apparmor.d/kubernetes
# if nothing is printed out the profile was loaded


kubectl exec my-pod -- cat /proc/1/attr/current
=> see if profile is available

<!-- TODO tmp test exists maybe another file -->
kubectl exec my-pod -- touch /tmp/test
=> error

<!-- TODO maybe setup apparmor in general setup -->





# disable profile
apparmor_parser -R /etc/apparmor.d/root.add_data.sh
# if nothing is printed out the profile was loaded
ln -s /etc/apparmor.d/root.add_data.sh /etc/apparmor.d/disable/

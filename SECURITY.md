## Archlinux Security Setup
-----------------------
### 1) Do not use the root account for daily use
Following the principle of least privilege, do not use the root user for daily use. Create a non-privileged user account for each person using the system. Use sudo as necessary for temporary privileged access.
### 2) Delay after a failed login attempt
Edit __*/etc/pam.d/system-login*__ file and add the following line. Delay 4 seconds
```
auth optional pam_faildelay.so delay=4000000
```
### 3) Restricting root login
__Before starting make sure you have created a user with wheel group and allowed the wheel group user to run sudo commands__\
Lock the root user account by running this command
```
passwd --lock root
```
If you need to unlock root user account, run this command
```
sudo passwd --unlock root
```
### 4) Deny root login via SSH
Edit the __*/etc/ssh/sshd_config.d/20-deny_root.conf*__ and add the following code 
```
PermitRootLogin no
```

### 5) Restricting access to kernel pointers
__*/etc/sysctl.d/51-kptr-restrict.conf*__
```
kernel.kptr_restrict = 1
```
### 6) Use any firewalls
#!/bin/bash

SELINUXSTATUS=$(getenforce)

if [ "$SELINUXSTATUS" == "Enforcing" ] || [ "$SELINUXSTATUS" = "Permissive" ]; then
    echo "Disable SeLinux"
    sudo sed -c -i "s/\SELINUX=.*/SELINUX=disabled/" /etc/sysconfig/selinux
else
    echo "SELinux is disabled (or missing)"
fi;

#!/bin/bash

if [ $ID == "centos" ]; then
    case $VERSION_ID in
        8)
            echo "Fix Yum Repos"
            sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-Stream-*
            sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-Stream-*
            ;;
    esac
fi

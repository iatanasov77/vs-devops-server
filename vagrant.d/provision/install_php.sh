#!/bin/bash

mkdir -p /etc/puppetlabs/facter/facts.d

if [ $ID == "centos" ]; then
    rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY*
    yum -y install epel-release
    
    # MySql 5.7
    #rpm -Uvh https://repo.mysql.com/mysql80-community-release-el7-3.noarch.rpm
    #sed -i 's/enabled=1/enabled=0/' /etc/yum.repos.d/mysql-community.repo
    #yum --enablerepo=mysql57-community install -y mysql-community-server
    
    # PHP7
    rpm -ivh http://rpms.remirepo.net/enterprise/remi-release-7.rpm
    yum-config-manager --enable remi-php72
    yum install -y php mod_php php-common php-opcache php-mcrypt php-cli php-gd php-curl php-mysql php-zip

    if [ ! -f /etc/httpd/modules/libphp7.2.so ]; then
    	echo 'Create sym link to mod_php for php7'
        ln -s /usr/lib64/httpd/modules/libphp7.so /usr/lib64/httpd/modules/libphp7.2.so
        #ln -s /usr/lib64/httpd/modules/libphp7.so /usr/lib64/httpd/modules/libphp.so
    fi
else
	apt-get update -y
fi

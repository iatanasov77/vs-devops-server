#!/bin/bash

source /vagrant/vagrant.d/provision/detect_linux.sh
source /vagrant/vagrant.d/provision/make_swap.sh

#######################################################################################
# The CentOS Linux 8 packages have been removed from the mirrors. 
# If you haven’t already, convert any CentOS Linux 8 installations to Stream 8
#######################################################################################
if [[ $ID == "centos" && $VERSION_ID == "8" ]]; then
    dnf -y --disablerepo '*' --enablerepo extras swap centos-linux-repos centos-stream-repos
    dnf -y distro-sync
fi

#source /vagrant/vagrant.d/provision/install_php.sh
source /vagrant/vagrant.d/provision/install_puppet.sh
    
#if [ $ID == "centos" ] && [ $VERSION_ID == "8" ]; then
#    source /vagrant/vagrant.d/provision/centos8_install_gitlab.sh
#fi

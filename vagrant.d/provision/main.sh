#!/bin/bash

source /vagrant/vagrant.d/provision/detect_linux.sh
source /vagrant/vagrant.d/provision/make_swap.sh
#source /vagrant/vagrant.d/provision/install_php.sh
source /vagrant/vagrant.d/provision/install_puppet.sh
    
if [ $ID == "centos" ] && [ $VERSION_ID == "8" ]; then
    #source /vagrant/vagrant.d/provision/centos8_install_gitlab.sh
fi

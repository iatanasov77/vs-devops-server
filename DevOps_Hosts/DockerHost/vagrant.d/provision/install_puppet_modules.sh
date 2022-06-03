#!/bin/bash

if [ $ID == "centos" ]; then
   
    # Workaround: Puppet cannot find installed modules
    echo "Remove /usr/share/puppet/modules and link that dir to current installed modules ./modules"
    sudo rm -rf /opt/puppetlabs/puppet/modules
    sudo ln -sf /vagrant/vagrant.d/puppet/modules /opt/puppetlabs/puppet/modules
    
    # Register Custom Facts
    export FACTERLIB="/vagrant/vagrant.d/puppet/modules/git/lib/facter"
    
    ########################################################################
    # NOT USE LIBRARIAN, AT NOW USED GIT SUBMODULES TO ADD PUPPET MODULES
    ########################################################################
    #echo "installing Puppet-Librarian"
    #sudo yum install gem -y
    #sudo gem install librarian-puppet
else

    # Workaround: Puppet cannot find installed modules
    echo "Remove /usr/share/puppet/modules and link that dir to current installed modules ./modules"
    sudo rm -rf /usr/share/puppet/modules
    sudo ln -sf /vagrant/vagrant.d/puppet/modules /usr/share/puppet/modules
    
    #echo "installing Puppet-Librarian"
    #sudo apt-get -y install librarian-puppet
    #sudo apt-get -y install curl
fi

#!/bin/bash

echo "installing Puppet"

if [ $ID == "centos" ]; then
    sudo rpm -ivh https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm
    sudo yum -y install puppet
    
    sudo ln -s /opt/puppetlabs/bin/puppet /usr/local/bin/puppet
    
    echo "ensure puppet service is running"
    sudo /opt/puppetlabs/bin/puppet resource service puppet ensure=running enable=true
    
    echo "ensure puppet service is running for standalone install"
    sudo /opt/puppetlabs/bin/puppet resource cron puppet-apply ensure=present user=root minute=30 command='/usr/bin/puppet apply $(puppet apply --configprint manifest)'
    
    echo "Remove /usr/share/puppet/modules and link that dir to current installed modules ./modules"
    sudo rm -rf /opt/puppetlabs/puppet/modules
    sudo ln -sf /vagrant/vagrant.d/puppet/modules /opt/puppetlabs/puppet/modules

else
    wget https://apt.puppetlabs.com/puppetlabs-release-trusty.deb
    sudo dpkg -i puppetlabs-release-trusty.deb
    sudo apt-get update
    sudo apt-get -y install puppet
    
    echo "ensure puppet service is running"
    sudo puppet resource service puppet ensure=running enable=true
    
    echo "ensure puppet service is running for standalone install"
    sudo puppet resource cron puppet-apply ensure=present user=root minute=30 command='/usr/bin/puppet apply $(puppet apply --configprint manifest)'
    
    # Workaround: Puppet cannot find installed modules
    echo "Remove /usr/share/puppet/modules and link that dir to current installed modules ./modules"
    sudo rm -rf /usr/share/puppet/modules
    sudo ln -sf /vagrant/vagrant.d/puppet/modules /usr/share/puppet/modules
fi

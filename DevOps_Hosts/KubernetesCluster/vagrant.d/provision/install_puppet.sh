#!/bin/bash

echo "installing Puppet"
mkdir -p /etc/puppetlabs/facter/facts.d

if [ $ID == "centos" ]; then
	if [ $VERSION_ID == "8" ]; then
		sudo rpm -ivh https://yum.puppet.com/puppet6-release-el-8.noarch.rpm
		sudo dnf -y install puppet
	elif [ $VERSION_ID == "7" ]; then
		sudo rpm -ivh https://yum.puppet.com/puppet6-release-el-7.noarch.rpm
	    #sudo rpm -ivh https://yum.puppetlabs.com/puppet5/puppet5-release-el-7.noarch.rpm
	    #sudo rpm -ivh https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm
	    sudo yum -y install puppet	
	else
		echo "Not Supported"
	fi

    sudo ln -s /opt/puppetlabs/bin/puppet /usr/local/bin/puppet
    
    echo "ensure puppet service is running"
    sudo /opt/puppetlabs/bin/puppet resource service puppet ensure=running enable=true
    
    echo "ensure puppet service is running for standalone install"
    sudo /opt/puppetlabs/bin/puppet resource cron puppet-apply ensure=present user=root minute=30 command='/usr/bin/puppet apply $(puppet apply --configprint manifest)'
else
    #wget https://apt.puppetlabs.com/puppetlabs-release-trusty.deb
    #sudo dpkg -i puppetlabs-release-trusty.deb
    
    #wget https://apt.puppetlabs.com/puppet6-release-bionic.deb
	#sudo dpkg -i puppet6-release-bionic.deb
	
	wget https://apt.puppetlabs.com/puppet6-release-focal.deb
	sudo dpkg -i puppet6-release-focal.deb
    
    sudo apt-get update
    sudo apt-get -y install puppet
    
    echo "ensure puppet service is running"
    sudo puppet resource service puppet ensure=running enable=true
    
    echo "ensure puppet service is running for standalone install"
    sudo puppet resource cron puppet-apply ensure=present user=root minute=30 command='/usr/bin/puppet apply $(puppet apply --configprint manifest)'
fi

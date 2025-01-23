#!/bin/bash

echo "installing Puppet"
mkdir -p /etc/puppetlabs/facter/facts.d

if [ $ID == "almalinux" ]; then
    case $PLATFORM_ID in
        "platform:el8")
            #sudo rpm -ivh https://yum.puppet.com/puppet6-release-el-8.noarch.rpm
            sudo rpm -ivh https://yum.puppet.com/puppet7-release-el-8.noarch.rpm
            ;;
        "platform:el9")
            #sudo rpm -ivh https://yum.puppetlabs.com/puppet6-release-el-9.noarch.rpm
            sudo rpm -ivh https://yum.puppetlabs.com/puppet7-release-el-9.noarch.rpm
            ;;
        *)
            echo "Not Supported"
            ;;
    esac

    sudo dnf -y install puppet
    sudo ln -s /opt/puppetlabs/bin/puppet /usr/local/bin/puppet
    
    echo "ensure puppet service is running"
    sudo /opt/puppetlabs/bin/puppet resource service puppet ensure=running enable=true
    
    echo "ensure puppet service is running for standalone install"
    sudo /opt/puppetlabs/bin/puppet resource cron puppet-apply ensure=present user=root minute=30 command='/usr/bin/puppet apply $(puppet apply --configprint manifest)'
elif [ $ID == "centos" ]; then
	case $VERSION_ID in
        7)
            sudo rpm -ivh https://yum.puppet.com/puppet6-release-el-7.noarch.rpm
            ;;
        8)
            #sudo rpm -ivh https://yum.puppet.com/puppet6-release-el-8.noarch.rpm
            sudo rpm -ivh https://yum.puppet.com/puppet7-release-el-8.noarch.rpm
            ;;
        9)
            #sudo rpm -ivh https://yum.puppetlabs.com/puppet6-release-el-9.noarch.rpm
            sudo rpm -ivh https://yum.puppetlabs.com/puppet7-release-el-9.noarch.rpm
            ;;
        *)
            echo "Not Supported"
            ;;
    esac

    sudo yum -y install puppet
    sudo ln -s /opt/puppetlabs/bin/puppet /usr/local/bin/puppet
    
    echo "ensure puppet service is running"
    sudo /opt/puppetlabs/bin/puppet resource service puppet ensure=running enable=true
    
    echo "ensure puppet service is running for standalone install"
    sudo /opt/puppetlabs/bin/puppet resource cron puppet-apply ensure=present user=root minute=30 command='/usr/bin/puppet apply $(puppet apply --configprint manifest)'
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

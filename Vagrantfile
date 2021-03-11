# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION	= '2'

def fail_with_message( msg )
	fail Vagrant::Errors::VagrantError.new, msg
end

if ! Vagrant.has_plugin? 'vagrant-env'
	fail_with_message "vagrant-env missing, please install the plugin with this command:
			vagrant plugin install vagrant-env"
end

if ! Vagrant.has_plugin? 'vagrant-hostmanager'
	fail_with_message "vagrant-hostmanager missing, please install the plugin with this command:
		vagrant plugin install vagrant-hostmanager"
end

###################################################################################
# RUN VAGRANT
###################################################################################
Vagrant.configure( VAGRANTFILE_API_VERSION ) do |vagrant_config|
	vagrant_config.env.enable
  
  	vagrant_config.hostmanager.enabled           	= true
    vagrant_config.hostmanager.manage_host       	= true
	vagrant_config.hostmanager.manage_guest 		= false
    vagrant_config.hostmanager.ignore_private_ip 	= false
    vagrant_config.hostmanager.include_offline   	= true
	vagrant_config.hostmanager.aliases				= []
	
	vagrant_config.hostmanager.aliases.push( "#{ENV['HOST_NAME']} www.#{ENV['HOST_NAME']}" )
	
	##############################
	# Config vagrant machine
	##############################
	vagrant_config.vm.define ENV['MASHINE_NAME'] do |config|

	  	config.vm.box				= ENV['VAGRANT_BOX']
		config.vm.box_check_update	= true

		config.vm.hostname 			= ENV['HOST_NAME']
		config.vm.network :private_network, ip: ENV['PRIVATE_IP']
		
	    if ENV['PUBLIC_NETWORK']
            config.vm.network :public_network, ip: ENV['PUBLIC_IP']
        end

		# Virtual Box Configuration
		config.vm.provider :virtualbox do |vb, override|
			vb.gui		= false
			vb.name		= ENV['MASHINE_NAME']
			vb.memory	= ENV['VBOX_MACHINE_MEMORY']
		end
		
		# Default Shared Folder
        config.vm.synced_folder "./", "/vagrant"
        
		# Mount Custom Shared Folders
	  	sharedFolders	= JSON.parse( ENV['SHARED_FOLDERS'] )
	  	sharedFolders.each do |mountPoint, mountDir|
	  		config.vm.synced_folder mountDir, mountPoint #owner: "root", group: "root"
	    end
    
        require 'yaml'
        provisionConfig     = YAML.load_file( 'vagrant.d/vagrantConfig.yaml' )
        jenkinsPluginDeps   = YAML.load_file( 'vagrant.d/jenkinsPluginDeps.yaml' )
        ansibleConfig       = YAML.load_file( 'ansible.d/ansibleConfig.yml' )
        nagiosConfig        = YAML.load_file( 'nagios.d/nagiosConfig.yml' )
        icingaConfig        = YAML.load_file( 'nagios.d/icingaConfig.yml' )
        
		# Run provision bash scripts to setup puppet environement
		config.vm.provision "shell", path: "vagrant.d/provision/main.sh", env: {
		  "SWAP_SIZE"     => ENV['VBOX_MACHINE_SWAP_SIZE'],
		}
		
		config.vm.provision :puppet do |puppet|
			puppet.manifests_path    = 'vagrant.d/puppet/manifests'
			puppet.module_path       = 'vagrant.d/puppet/modules'
			puppet.options           = ['--verbose', '--debug']

			puppet.manifest_file     = "default.pp"
			puppet.facter            = {
			    'vs_config'              => provisionConfig.to_yaml,
			    'jenkins_plugin_deps'    => jenkinsPluginDeps.to_yaml,
			    'ansible_config'         => ansibleConfig.to_yaml,
			    'nagios_config'          => nagiosConfig.to_yaml,
			    'icinga_config'          => icingaConfig.to_yaml,
                'hostname'               => ENV['HOST_NAME'],
			}
	    end
	    
		$done = <<-SCRIPT
echo ""
echo ""
echo "########################################################################################################################"
echo "# DONE!!!"
echo "# -------"
echo "#"
echo "# Enter Ansible Host: vagrant ssh "
echo "# Run Ansible provisioning: ansible-playbook -i /vagrant/ansible.d/inventory /vagrant/ansible.d/playbook.yml "
echo "#"
echo "# Now you can open http://#{ENV['HOST_NAME']} in your browser"
echo "#"
echo "########################################################################################################################"
echo "# NEED TO BE REORGANIZED"
echo "########################################################################################################################"
echo "#"
echo "# Open Icinga2 in your host machine browser http://devops.lh/icingaweb2/"
echo "#                                     user: icingaadmin | pass: icinga"
echo "#"
echo "# Open Nagios in your host machine browser http://devops.lh/nagios/ "
echo "#                              user: nagiosadmin | pass: nagiosadmin"
echo "#"
echo "# Support at: https://github.com/iatanasov77/vs-devops-server"
echo "########################################################################################################################"
SCRIPT
		config.vm.provision "shell", inline: $done

	end
end

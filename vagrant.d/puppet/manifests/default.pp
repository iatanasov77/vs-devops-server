#######################################################################################################################
# Main Manifest
#######################################################################################################################

$vsConfig       = parseyaml( $facts['vs_config'] )
$ansibleConfig  = parseyaml( $facts['ansible_config'] )
$nagiosConfig   = parseyaml( $facts['nagios_config'] )
$icingaConfig   = parseyaml( $facts['icinga_config'] )

# Set default path for Exec calls
Exec {
    path => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/', '/usr/local/bin/', '/usr/local/sbin/' ]
}

node default
{
	#include epel # Caannot redeclare error
	include stdlib 
	
	include vs_devops
	
	# need 'epel' because load at last
	include vs_devops::packages
	
	# puppet module install saz-sudo --version 5.0.0
	sudo::conf { "vagrant":
	    ensure			=> "present",
	    content			=> "vagrant ALL=(ALL) NOPASSWD: ALL",
	    sudo_file_name	=> "vagrant",
	}
}

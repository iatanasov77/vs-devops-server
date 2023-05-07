#######################################################################################################################
# Main Manifest
#######################################################################################################################

$vsConfig       = parseyaml( $facts['vs_config'] )
$nagiosConfig   = parseyaml( $facts['nagios_config'] )
$icingaConfig   = parseyaml( $facts['icinga_config'] )
$gitCredentials = parsejson( $facts['git_credentials'] )

# Set default path for Exec calls
Exec {
    path => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/', '/usr/local/bin/', '/usr/local/sbin/' ]
}

node default
{
	#include epel # Caannot redeclare error
	include stdlib 

	class { '::vs_devops':
        dependencies                => $vsConfig['dependencies'],
        
        defaultHost                 => "${hostname}",
        defaultDocumentRoot         => "${vsConfig['gui']['documentRoot']}",
        
        subsystems                  => $vsConfig['subsystems'],

        packages                    => $vsConfig['packages'],
        gitUserName                 => $vsConfig['git']['userName'],
        gitUserEmail                => $vsConfig['git']['userEmail'],
        gitCredentials              => $gitCredentials,
        
        vstools                     => $vsConfig['vstools'],
        frontendtools               => $vsConfig['frontendtools'],
        
        #############################################################################
        # LAMP SERVER
        #############################################################################
        forcePhp7Repo              	=> $vsConfig['lamp']['forcePhp7Repo'],
    	mySqlProvider				=> $vsConfig['lamp']['mysql']['provider'],
        phpVersion                  => "${vsConfig['lamp']['phpVersion']}",
        apacheModules               => $vsConfig['lamp']['apacheModules'],
        
        phpModules                  => $vsConfig['lamp']['phpModules'],
        phpunit                     => $vsConfig['lamp']['phpunit'],
        
        phpSettings                 => $vsConfig['lamp']['phpSettings'],
        
        phpMyAdmin					=> $vsConfig['lamp']['phpMyAdmin'],
    }
    
	# puppet module install saz-sudo --version 5.0.0
	sudo::conf { "vagrant":
	    ensure			=> "present",
	    content			=> "vagrant ALL=(ALL) NOPASSWD: ALL",
	    sudo_file_name	=> "vagrant",
	}
}

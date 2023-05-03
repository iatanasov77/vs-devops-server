#######################################################################################################################
# Main Manifest
#######################################################################################################################

$vsConfig       = parseyaml( $facts['vs_config'] )
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

	class { '::vs_devops':
        dependencies                => $vsConfig['dependencies'],
        
        defaultHost                 => "${hostname}",
        defaultDocumentRoot         => '/vagrant/gui/public',	# "${vsConfig['gui']['documentRoot']}",
        
        subsystems                  => $vsConfig['subsystems'],

        packages                    => $vsConfig['packages'],
        gitUserName                 => $vsConfig['git']['userName'],
        gitUserEmail                => $vsConfig['git']['userEmail'],
        gitCredentials              => $facts['git_credentials'],
        
        vstools                     => $vsConfig['vstools'],
        
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

	####################################################################
	# Setup Credentials
	# ------------------
    # https://learn.hashicorp.com/tutorials/vault/static-secrets
    ####################################################################
    $secrets    = parsejson( $facts['secrets'] )
    
    if $vsConfig['subsystems']['hashicorp']['vault'] {
    	stage { 'vault-setup': }
        Stage['main'] -> Stage['vault-setup']
        class { '::vs_devops::subsystems::hashicorp::vaultSetup':
            vaultSetup  => "/usr/bin/php /vagrant/vault.d/vault_setup.php -p${vsConfig['subsystems']['hashicorp']['vaultPort']} -d '${facts['secrets_file']}'",
            stage       => 'vault-setup',
        }
    }
}

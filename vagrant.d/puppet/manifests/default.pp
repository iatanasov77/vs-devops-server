#######################################################################################################################
# Main Manifest
#######################################################################################################################

$vsConfig       = parseyaml( $facts['vs_config'] )

node default
{
    include epel
	include stdlib
	
	$vsConfig['packages'].each |Integer $index, String $value|
	{
        if ( $value == 'git' ) {
            require git
                
            git::config { 'user.name':
                value => $vsConfig['git']['userName'],
                user    => 'vagrant',
            }
            git::config { 'user.email':
                value => $vsConfig['git']['userEmail'],
                user    => 'vagrant',
            }
        } elsif ( $value == 'gitflow' and $operatingsystem == 'Ubuntu' ) {
            package { 'git-flow':
                ensure => present,
            }
        } else {
            package { $value:
                ensure => present,
            }
        }
    }
	
	#notice( "SERVICE GITLAB VALUE: ${$vsConfig['services']['gitlab']}" )
	
	if ( $vsConfig['services']['gitlab'] == true )
    {
    	class { 'gitlab':
            external_url => 'http://devops.lh',
            unicorn => {
                'worker_timeout' => 300
            },
        }
    }
    
    if ( $vsConfig['services']['jenkins'] == true )
    {
        class{ 'jenkins':
            config_hash => {
                'HTTP_PORT' => { 'value' => '8081' },
                #'AJP_PORT'  => { 'value' => '9009' },
            }
        }
    }

	# puppet module install saz-sudo --version 5.0.0
	sudo::conf { "vagrant":
	    ensure			=> "present",
	    content			=> "vagrant ALL=(ALL) NOPASSWD: ALL",
	    sudo_file_name	=> "vagrant",
	}
}

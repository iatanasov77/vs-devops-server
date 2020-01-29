#######################################################################################################################
# Main Manifest
#######################################################################################################################

$vsConfig       = parseyaml( $facts['vs_config'] )

node default
{
	include stdlib
	
	$vsConfig['packages'].each |Integer $index, String $value| {
     
        case $value
        {
            'git':
            {
                require git
                
                git::config { 'user.name':
                    value => $vsConfig['git']['userName'],
                    user    => 'vagrant',
                }
                git::config { 'user.email':
                    value => $vsConfig['git']['userEmail'],
                    user    => 'vagrant',
                }
            }
            'gitflow':
            {
                case $operatingsystem 
                {
                    'Debian', 'Ubuntu':
                    {
                        package { 'git-flow':
                            ensure => present,
                        }
                    }
                    default:
                    {
                        package { $value:
                            ensure      => present,
                            provider    => 'rpm',
                            source      => 'http://dl.fedoraproject.org/pub/epel/7/SRPMS/Packages/g/gitflow-0.4.2.20120723git53e9c76-4.el7.src.rpm'
                        }
                    }
                }
            }
            default:
            {
                package { $value:
                    ensure => present,
                }
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
        include jenkins
    }

	# puppet module install saz-sudo --version 5.0.0
	sudo::conf { "vagrant":
	    ensure			=> "present",
	    content			=> "vagrant ALL=(ALL) NOPASSWD: ALL",
	    sudo_file_name	=> "vagrant",
	}
}

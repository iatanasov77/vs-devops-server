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
	
	if ( $vsConfig['services']['jenkins'] == true )
    {
        class{ 'jenkins':
            config_hash => {
                'JENKINS_PORT'	=> { 'value' => '8080' },
            }
        }
        
        jenkins::plugin { 'git':
			version => '1.1.11',
		}
		
		jenkins::plugin { 'ftppublisher':
		
		}
		
		jenkins::plugin { 'publish-over':
        
        }
		jenkins::plugin { 'publish-over-ftp':
		
		}
		
		# Install Maven
		class { "maven::maven":
		    #version => "3.2.5", # version to install
		    # you can get Maven tarball from a Maven repository instead than from Apache servers, optionally with a user/password
		    repo => {
				#url => "http://repo.maven.apache.org/maven2",
				#username => "",
				#password => "",
		    }
		}
		
		
    }
    
	if ( $vsConfig['services']['gitlab'] == true )
    {
    	class { 'gitlab':
            external_url => 'http://devops.lh',
            unicorn => {
                'worker_timeout'	=> 300,
                'port'				=> 8081
            },
        }
    }
    
    

	# puppet module install saz-sudo --version 5.0.0
	sudo::conf { "vagrant":
	    ensure			=> "present",
	    content			=> "vagrant ALL=(ALL) NOPASSWD: ALL",
	    sudo_file_name	=> "vagrant",
	}
}

class vs_dockerhost (
    Hash $dependencies          = {},
    
	String $defaultHost,
    
	Hash $subsystems			= {},
	
	Array $packages             = [],
    String $gitUserName         = 'undefined_user_name',
    String $gitUserEmail        = 'undefined@example.com',
    Array $gitCredentials       = [],
    
    Hash $vstools               = {},
    Hash $frontendtools         = {},
) {
    ######################################################################
    # Stages After Main
    ######################################################################
    stage { 'git-setup': }
    stage { 'vault-setup': }
    stage { 'packer-setup': }
    stage { 'notify-services': }
    Stage['main']   -> Stage['git-setup']
                    -> Stage['vault-setup'] -> Stage['packer-setup']
                    -> Stage['notify-services']
    
    ######################################################################
    # Stages Before Main
    ######################################################################
    stage { 'dependencies-install': before => Stage['main'] }
    
    ######################################################################
    # Start Configuration
    ######################################################################
    class { 'vs_core::scripts':

    }
    
	class { '::vs_core::dependencies::repos':
        dependencies  => $dependencies,
		phpVersion    => '8.1',
		mySqlProvider => 'mariadb',
		stage         => 'dependencies-install',
	} ->
    class { 'vs_core::dependencies::packages':
        gitUserName     => $gitUserName,
        gitUserEmail    => $gitUserEmail,
        stage           => 'dependencies-install',
    }
	
	class { 'vs_core::dependencies::git_setup':
        gitUserName     => $gitUserName,
        gitUserEmail    => $gitUserEmail,
        gitCredentials  => $gitCredentials,
        stage           => 'git-setup',
    }
    
	class { '::vs_core::vstools':
        vstools => $vstools,
    }
    
	class { '::vs_core::packages':
        packages        => $packages,
        gitUserName     => $gitUserName,
        gitUserEmail    => $gitUserEmail,
    }
    
    class { '::vs_core::frontendtools':
        frontendtools   => $frontendtools,
    }
    
	class { '::vs_dockerhost::subsystems':
        subsystems      => $subsystems,
    }
}

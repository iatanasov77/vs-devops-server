Exec {
    path => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/', '/usr/local/bin', '/usr/local/sbin/' ]
}

node default
{
    host { 'kube-controller':
        host_aliases    => ['kube-controller.lh'],
        ensure          => 'present',
        ip              => '10.0.254.2',
        target          => '/etc/hosts',
    }
    
    host { 'kube-worker':
        host_aliases    => ['kube-worker.lh'],
        ensure          => 'present',
        ip              => '10.0.254.3',
        target          => '/etc/hosts',
    }

    class { 'docker':
        ensure          => 'present',
        #version         => '17.03',
        version         => 'latest',
        docker_users    => ['vagrant', 'root'],
    }
    
    class { 'docker::compose':
        ensure => present,
    }

    class { 'kubernetes':
        worker                  => true,
        
        manage_etcd             => true,
        manage_docker           => false,
        
        ignore_preflight_errors => [
            'FileExisting-conntrack',
            #all,
        ],
    } ->

    # Config sudo users
    sudo::conf { "vagrant":
        ensure          => "present",
        content         => "vagrant ALL=(ALL) NOPASSWD: ALL",
        sudo_file_name  => "vagrant",
    }
}

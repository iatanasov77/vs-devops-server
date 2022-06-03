# Set default path for Exec calls
Exec {
    path => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/', '/usr/local/bin', '/usr/local/sbin/' ]
}

node default
{
    # Install docker
    class { 'docker':
        ensure          => 'present',
        version         => 'latest',
        docker_users    => ['vagrant', 'root'],

        tcp_bind    => ["tcp://${facts['hostip']}:2375"],
        socket_bind => 'unix:///var/run/docker.sock',
        ip_forward  => true,
        iptables    => true,
        ip_masq     => true,
    }

    # Install Some Packages
    ['net-tools', 'mc', 'vim', 'dos2unix'].each | String $value | {
        if ! defined( Package[$value] ) {
            package { $value:
                ensure => present,
            }
        }
    }

    # Config sudo users
    sudo::conf { "vagrant":
        ensure          => "present",
        content         => "vagrant ALL=(ALL) NOPASSWD: ALL",
        sudo_file_name  => "vagrant",
    }
}

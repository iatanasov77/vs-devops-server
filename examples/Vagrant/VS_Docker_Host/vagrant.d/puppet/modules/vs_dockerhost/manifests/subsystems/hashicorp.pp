class vs_dockerhost::subsystems::hashicorp (
	Hash $config       = {},
) {
    class { 'vs_core::hashicorp':
        config  => $config,
    }
}

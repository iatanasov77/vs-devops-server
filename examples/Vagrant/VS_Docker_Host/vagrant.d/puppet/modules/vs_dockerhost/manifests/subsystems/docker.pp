class vs_dockerhost::subsystems::docker (
	Hash $config    = {},
) {
    class { 'vs_core::docker':
        config  => $config,
    }
}

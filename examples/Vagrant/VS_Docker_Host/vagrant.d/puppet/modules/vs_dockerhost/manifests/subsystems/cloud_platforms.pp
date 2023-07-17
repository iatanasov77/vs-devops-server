class vs_dockerhost::subsystems::cloud_platforms (
    Hash $config    = {},
) {
    class { 'vs_core::cloud_platforms':
        config  => $config,
    }
}

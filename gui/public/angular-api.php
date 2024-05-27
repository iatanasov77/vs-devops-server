<?php
header( "Access-Control-Allow-Origin: *" );

$globals    = json_decode( file_get_contents( dirname( __FILE__ ) . "/../var/globals.json" ), true );
$subsystems = json_decode( file_get_contents( dirname( __FILE__ ) . "/../var/subsystems.json" ), true );
$vaultKeys  = json_decode( file_get_contents( dirname( __FILE__ ) . "/../var/vault.json" ), true );

$devOpsConfig   = [
    'hostAddress'   => $globals['hostAddress'],
    
    'subsystems'    => $subsystems,
    'vaultKeys'     => $vaultKeys,
];
echo json_encode( $devOpsConfig, JSON_PRETTY_PRINT );
?>
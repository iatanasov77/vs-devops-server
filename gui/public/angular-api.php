<?php
header( "Access-Control-Allow-Origin: *" );
echo file_get_contents( dirname( __FILE__ ) . "/../var/subsystems.json" );
?>
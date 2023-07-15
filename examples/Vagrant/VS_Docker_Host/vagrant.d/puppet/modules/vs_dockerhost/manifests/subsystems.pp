class vs_dockerhost::subsystems (
    Hash $subsystems    = {},
) {
	$subsystems.each |String $subsysKey, Hash $subsys| {
     
        case $subsysKey
        {
            'icinga':
            {
                if ( $subsys['enabled'] ) {
                    notice( "INSTALING SUBSYSTEM: ${subsysKey}" )
                }
            }
            default:
            {
                if ( $subsys['enabled'] ) {
                    class { "::vs_dockerhost::subsystems::${$subsysKey}":
                    	config	=> $subsys,
                    }
                }
      
            }
        }
    }
}

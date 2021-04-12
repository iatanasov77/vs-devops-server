<?php
/*
 * Init Options
 */
$shortopts  = "t:i:c:";
$longopts   = ["type:", "index:","config:"];
$options    = getopt( $shortopts, $longopts );

// createJobXml.php -t 'Pipeline' -i 'vankosoft-site' -c '{"plugins":{"flowPlugin":"workflow-job@2.40","definitionPlugin":"workflow-cps@2.90"},"pipeline":"/projects/VankoSoft.Org/Jenkinsfile"}'
function renderTemplate( $tpl, $params )
{
    $tplKeys	= array_map(
        function( $key ) { return sprintf( '{__%s__}', $key ); },
        array_keys( $params )
    );
    
    return str_replace( $tplKeys, array_values( $params ), $tpl );
}

/**
 * Main Script
 */
$config  = json_decode( $options['c'], true );
switch ( $options['t'] ) {
    case 'Pipeline':
        $jobConfig['flowPlugin']        = $config['plugins']['flowPlugin'];
        $jobConfig['definitionPlugin']  = $config['plugins']['definitionPlugin'];
        $jobConfig['pipelineScript']    = htmlentities( file_get_contents( $config['pipeline'] ) );
        break;
    default:
        die( 'Unknown Jenkins Job Type !!!' );
}

$jobXml		= renderTemplate( file_get_contents( dirname( __FILE__ ) . "/templates/jobs/{$options['t']}.xml.tpl" ), $jobConfig );
file_put_contents( "/tmp/jenkins-job-{$options['i']}.xml", $jobXml);


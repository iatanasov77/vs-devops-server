<?php 
    $configSubsystems = json_decode( file_get_contents( dirname( __FILE__ ) . "/../var/subsystems.json" ), true );
?>
<!DOCTYPE html>
<html lang="en">
    <head>
      <meta charset="utf-8" />
    </head>
    
    <body>
    	<div id="container">
    		<div style="border: 1px solid black; width: 300px; height: 150px; margin: 20px; text-align: center; float: left;">
        		<h3>PHP Info</h3>
        		<a href="http://devops.lh/info.php" target="__blank">Open PHP Info</a>
        	</div>
        	<div style="border: 1px solid black; width: 300px; height: 150px; margin: 20px; text-align: center; float: left;">
        		<h3>PhpMyAdmin</h3>
        		<a href="http://devops.lh/phpmyadmin/" target="__blank">Open PhpMyAdmin</a>
        		<p>
            		<div>User: root</div>
                	<div>Pass: vagrant</div>
                </p>
        	</div>
        </div>
        <div style="clear: both;"></div>
        <div id="container">
        <?php if ( $configSubsystems['terraform']['enabled'] ) {?>
        	<div style="border: 1px solid black; width: 300px; height: 150px; margin: 20px; text-align: center; float: left;">
        		<h3>Terraform</h3>
        		<p>
            		<div>cd /vagrant/terraform.d</div>
					<div>terraform init</div>
					<div>terraform apply</div>
				</p>
				<p>
					<div>And then open in your host browser http://docker.lh</div>
                </p>
        	</div>
        <?php } ?>
        </div>
        <div style="clear: both;"></div>
        


    	<div id="container">
    	<?php if ( $configSubsystems['jenkins']['enabled'] ) {?>
        	<div style="border: 1px solid black; width: 300px; height: 150px; margin: 20px; text-align: center; float: left;">
        		<h3>Jenkins Master Automation Server</h3>
        		<a href="http://devops.lh:8080" target="__blank">Open Jenkins</a>
        		<p>
            		<div>User: admin</div>
                	<div>Pass: admin</div>
                </p>
        	</div>
        <?php } ?>
        </div>
        <div style="clear: both;"></div>
    	<div id="container">
    	<?php if ( $configSubsystems['nagios']['enabled'] ) {?>
    		<div style="border: 1px solid black; width: 300px; height: 150px; margin: 20px; text-align: center; float: left;">
        		<h3>Nagios Monitoring Server</h3>
        		<a href="http://devops.lh/nagios/" target="__blank">Open Nagios</a>
        		<p>
            		<div>User: nagiosadmin</div>
                	<div>Pass: nagiosadmin</div>
                </p>
        	</div>
        <?php } ?>	
        <?php if ( $configSubsystems['icinga']['enabled'] ) {?>
    		<div style="border: 1px solid black; width: 300px; height: 150px; margin: 20px; text-align: center; float: left;">
        		<h3>Icinga2 Monitoring Server</h3>
        		<a href="http://devops.lh/icingaweb2/" target="__blank">Open Icinga2</a>
        		<p>
            		<div>User: icingaadmin</div>
                	<div>Pass: icinga</div>
                </p>
        	</div>
        <?php } ?>
        </div>
    </body>
</html>
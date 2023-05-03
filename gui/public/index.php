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
        	<div style="border: 1px solid black; width: 98%; height: auto; margin: 20px; text-align: center;">
        		<h3>Terraform Examples</h3>
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
        <?php if ( $configSubsystems['ansible']['enabled'] ) {?>
        	<div style="border: 1px solid black; width: 98%; height: auto; margin: 20px; text-align: center;">
        		<h3>Ansible Examples</h3>
        		<p>
        			<div>ansible-galaxy install --roles-path /vagrant/ansible.d/playbook/roles -r /vagrant/ansible.d/requirements.yml --force</div>
            		<div>sudo ansible-playbook -i /vagrant/ansible.d/inventory /vagrant/ansible.d/playbook/install-jenkins-slaves.yml</div>
				</p>
				<h3>Setup Default JRE Version</h3>
        		<p>
            		<div>sudo alternatives --config java</div>
				</p>
				<h3>Start/Restart Jenkins Swarm Client on Slave Host</h3>
        		<p>
            		<div>sudo service jenkins-swarm-client restart</div>
				</p>
        	</div>
        <?php } ?>
        	<div style="border: 1px solid black; width: 98%; height: auto; margin: 20px; text-align: center;">
        		<h3>How to Fix Guest Additions to Can Mount Shared Folders</h3>
        		<p>
            		<div>sudo yum install elfutils-libelf-devel</div>
            		<div>cd /opt/VBoxGuestAdditions-*/init</div>
            		<div>sudo ./vboxadd setup</div>
				</p>
        	</div>
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
        <?php if ( $configSubsystems['hashicorp']['enabled'] && isset( $configSubsystems['hashicorp']['vault'] ) ) {?>
        	<div style="border: 1px solid black; width: 300px; height: 150px; margin: 20px; text-align: center; float: left;">
        		<h3>Vault Server</h3>
        		<a href="http://devops.lh:8282/ui" target="__blank">Open Vault UI</a>
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
        <?php if ( $configSubsystems['elastic_stack']['enabled'] ) {?>
    		<div style="border: 1px solid black; width: 300px; height: 150px; margin: 20px; text-align: center; float: left;">
        		<h3>Elasticstack Server</h3>
        		<a href="http://devops.lh:5601" target="__blank">Open Elasticstack</a>
        	</div>
        <?php } ?>
        </div>
    </body>
</html>
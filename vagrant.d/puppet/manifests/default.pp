#######################################################################################################################
# Main Manifest
#######################################################################################################################
$vsConfig       = parseyaml( $facts['vs_config'] )

node default
{
	include devops
	
	# puppet module install saz-sudo --version 5.0.0
	sudo::conf { "vagrant":
	    ensure			=> "present",
	    content			=> "vagrant ALL=(ALL) NOPASSWD: ALL",
	    sudo_file_name	=> "vagrant",
	}
}

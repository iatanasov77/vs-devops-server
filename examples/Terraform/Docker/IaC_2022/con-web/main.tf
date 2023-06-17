terraform {
    required_providers {
        docker = {
            source = "kreuzwerker/docker"
        }
    }
}

provider "docker" {
    host = "tcp://10.3.3.4:2375/"
}

resource "docker_image" "img-web" {
    name = var.v_image
}

resource "docker_container" "con-web" {
    name    = var.v_con_name
    
    image   = docker_image.img-web.latest
    links   = ["${var.v_mysql_con_name}:dob-mysql"]
    
    ports {
        internal    = var.v_int_port
        external    = var.v_ext_port
    }
    
    volumes {
        host_path       = var.v_site_src
        container_path  = var.v_site_dest
    }
}

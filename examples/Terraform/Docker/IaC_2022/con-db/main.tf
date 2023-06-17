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

resource "docker_image" "img-db" {
    name = var.v_image
}

resource "docker_container" "con-db" {
    name    = var.v_con_name
    
    image   = docker_image.img-db.latest
    env     = ["MYSQL_ROOT_PASSWORD=${var.v_mysql_root_pass}"]
}

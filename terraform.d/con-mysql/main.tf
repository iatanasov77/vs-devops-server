provider "docker" {
    host = "tcp://192.168.111.101:2375/"
}

resource "docker_image" "img-mysql" {
    name = var.v_image
}

resource "docker_container" "con-mysql" {
    name    = var.v_con_name
    
    image   = docker_image.img-mysql.latest
    env     = ["MYSQL_ROOT_PASSWORD=${var.v_mysql_root_pass}"]
}

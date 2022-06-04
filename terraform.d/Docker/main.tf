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

module "con-db" {
    source      = "./con-db"
    v_image             = var.v_db_image
    v_con_name          = var.v_db_con_name
    v_mysql_root_pass   = var.v_mysql_root_pass
}

module "con-web" {
    source              = "./con-web"
    v_image             = var.v_web_image
    
    v_con_name          = var.v_web_con_name
    v_int_port          = var.v_web_int_port
    v_ext_port          = var.v_web_ext_port
    v_mysql_con_name    = module.con-db.container-name
    
    v_site_src          = var.v_site_src
    v_site_dest         = var.v_site_dest
}

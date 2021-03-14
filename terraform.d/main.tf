provider "docker" {
    host = "tcp://192.168.111.101:2375/"
}

module "con-mysql" {
    source      = "./con-mysql"
    v_image             = var.v_mysql_image
    v_con_name          = var.v_mysql_con_name
    v_mysql_root_pass   = var.v_mysql_root_pass
}

module "con-web" {
    source              = "./con-web"
    v_image             = var.v_web_image
    
    v_con_name          = var.v_web_con_name
    v_int_port          = var.v_web_int_port
    v_ext_port          = var.v_web_ext_port
    v_mysql_con_name    = module.con-mysql.container-name
    
    v_site_src          = var.v_site_src
    v_site_dest         = var.v_site_dest
}

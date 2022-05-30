# DB Vars
variable "v_db_image" {
    description = "Database Image"
    default     = "shekeriev/bgapp-db"
}

variable "v_db_con_name" {
    description = "DB Container Name"
    default     = "db"
}

variable "v_mysql_root_pass" {
    description = "Container Name"
    default     = "12345"
}


# Web Vars
variable "v_web_image" {
    description = "Web Image"
    default     = "shekeriev/bgapp-web"
}

variable "v_web_con_name" {
    description = "Web Container Name"
    default     = "site"
}

variable "v_web_int_port" {
    description = "Web Internal Port"
    default     = 80
}

variable "v_web_ext_port" {
    description = "Web External Port"
    default     = 80
}

variable "v_site_src" {
    description = "Host Path to Site Files"
    default     = "/vagrant/project/web/"
}

variable "v_site_dest" {
    description = "Container Document Root"
    default     = "/var/www/html/"
}

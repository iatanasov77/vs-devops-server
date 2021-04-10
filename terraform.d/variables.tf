variable "v_mysql_image" {
    description = "MySql Image"
    default     = "shekeriev/dob-w3-mysql"
}

variable "v_mysql_con_name" {
    description = "MySql Container Name"
    default     = "mysql"
}

variable "v_mysql_root_pass" {
    description = "Container Name"
    default     = "12345"
}

variable "v_web_image" {
    description = "Web Image"
    default     = "shekeriev/dob-w3-php"
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
    default     = "/vagrant/src/"
}

variable "v_site_dest" {
    description = "Container Document Root"
    default     = "/var/www/html/"
}

variable "v_image" {
    description = "Docker Image"
}

variable "v_con_name" {
    description = "Container Name"
}

variable "v_int_port" {
    description = "Internal Port"
}

variable "v_ext_port" {
    description = "External Port"
}

variable "v_mysql_con_name" {
    description = "MySql Container Name Needed for link"
}

variable "v_site_src" {
    description = "Host Path to Site Files"
}

variable "v_site_dest" {
    description = "Container Document Root"
}

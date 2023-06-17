variable "nginx_hello_docker_host" {
    description = "Deploy to Docker Host"
    default     = "unix:///var/run/docker.sock"
}

variable "nginx_hello_external_port" {
    description = "Web External Port"
    default     = 8080
}

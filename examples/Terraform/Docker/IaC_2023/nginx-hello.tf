terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {
  host = var.nginx_hello_docker_host
}

resource "docker_image" "nginx" {
  name = "nginxdemos/hello"
}

resource "docker_container" "nginx" {
  image = resource.docker_image.nginx.name
  name  = "nginx_hello"

  ports {
    internal = 80

    // Port 8080 is in Use by Jenkins, since i use differrent port from SoftUni Exersice
    external = var.nginx_hello_external_port
  }
}

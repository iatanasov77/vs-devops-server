terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"

  /*
   * if Docker is on Another Machine Use TCP Url to Host
   *------------------------------------------------------
   * host = "tcp://10.3.3.2:2375/"
   */
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
    external = 8888
  }
}

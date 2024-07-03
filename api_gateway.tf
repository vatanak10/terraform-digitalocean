resource "digitalocean_droplet" "api_gateway" {
  image  = "docker-18-04"
  name   = "api-gateway"
  region = "sgp1"
  size   = "s-1vcpu-1gb"
  ssh_keys = [
    data.digitalocean_ssh_key.terraform.id
  ]
  user_data = <<-EOF
    #!/bin/bash
    docker run -d --name kong \
      -e "KONG_DATABASE=off" \
      -e "KONG_DECLARATIVE_CONFIG=/etc/kong/kong.yml" \
      -e "KONG_PROXY_ACCESS_LOG=/dev/stdout" \
      -e "KONG_ADMIN_ACCESS_LOG=/dev/stdout" \
      -e "KONG_PROXY_ERROR_LOG=/dev/stderr" \
      -e "KONG_ADMIN_ERROR_LOG=/dev/stderr" \
      -e "KONG_ADMIN_LISTEN=0.0.0.0:8001" \
      -e "KONG_ADMIN_LISTEN_SSL=0.0.0.0:8444" \
      -p 8000:8000 \
      -p 8443:8443 \
      -p 8001:8001 \
      -p 8444:8444 \
      kong:latest
  EOF
}
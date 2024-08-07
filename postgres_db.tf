resource "digitalocean_database_cluster" "postgres_db" {
  name       = "postgres-cluster"
  engine     = "pg"
  version    = "13"
  size       = "db-s-1vcpu-1gb"
  region     = "sgp1"
  node_count = 1
}

resource "digitalocean_database_firewall" "db_firewall" {
  cluster_id = digitalocean_database_cluster.postgres_db.id

  rule {
    type  = "ip_addr"
    value = "0.0.0.0/0" # Allow all IPs for simplicity; restrict in production
  }
}

output "db_host" {
  value = digitalocean_database_cluster.postgres_db.host
}

output "db_port" {
  value = digitalocean_database_cluster.postgres_db.port
}

output "db_user" {
  value = digitalocean_database_cluster.postgres_db.user
}

output "db_password" {
  value = digitalocean_database_cluster.postgres_db.password
}

output "db_name" {
  value = digitalocean_database_cluster.postgres_db.name
}

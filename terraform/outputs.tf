output "master_node_ips" {
  value = "${join(",",digitalocean_droplet.master_nodes.*.ipv4_address)}"
}

output "etcd_node_ips" {
  value = "${join(",",digitalocean_droplet.etcd_nodes.*.ipv4_address)}"
}

output "worker_node_ips" {
  value = "${join(",",digitalocean_droplet.worker_nodes.*.ipv4_address)}"
}

output "ingress_node_ips" {
  value = "${join(",",digitalocean_droplet.ingress_nodes.*.ipv4_address)}"
}

output "storage_node_ips" {
  value = "${join(",",digitalocean_droplet.storage_nodes.*.ipv4_address)}"
}
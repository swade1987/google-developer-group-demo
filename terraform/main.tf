# Create a new tag
resource "digitalocean_tag" "cluster_tag" {
  name = "${var.cluster_tag}"
}

# Upload SSH key which all instances will use.
resource "digitalocean_ssh_key" "default" {
  name       = "${var.ssh_key_name}"
  public_key = "${file("${path.module}/../ssh/cluster.pem.pub")}"
}
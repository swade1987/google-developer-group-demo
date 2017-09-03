# Create the Kubernetes ingress nodes (e.g. ingress1)
resource "digitalocean_droplet" "ingress_nodes" {
  count              = "${var.ingress_count}"
  image              = "${var.image}"
  name               = "${format("ingress%1d", count.index + 1)}"
  region             = "${var.region}"
  size               = "${var.droplet_size}"
  ssh_keys           = ["${digitalocean_ssh_key.default.id}"]
  tags               = ["${digitalocean_tag.cluster_tag.id}"]
  private_networking = true
}
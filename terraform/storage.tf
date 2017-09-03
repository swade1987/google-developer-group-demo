# Create the GlusterFS storage nodes (e.g. storage1)
resource "digitalocean_droplet" "storage_nodes" {
  count              = "${var.storage_count}"
  image              = "${var.image}"
  name               = "${format("storage%1d", count.index + 1)}"
  region             = "${var.region}"
  size               = "${var.droplet_size}"
  ssh_keys           = ["${digitalocean_ssh_key.default.id}"]
  tags               = ["${digitalocean_tag.cluster_tag.id}"]
  private_networking = true
}
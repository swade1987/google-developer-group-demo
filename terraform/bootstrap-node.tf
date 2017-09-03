# Provisioning script for the bootstrap node.
data "template_file" "bootstrap_init" {
  template = "${file("${path.module}/user-data/provision-bootstrap-node.tpl")}"

  vars {
  }
}

# A bootstrap node to execute Kismatic from.
resource "digitalocean_droplet" "bootstrap_node" {
  image              = "${var.image}"
  name               = "bootstrap"
  region             = "${var.region}"
  size               = "${var.droplet_size}"
  ssh_keys           = ["${digitalocean_ssh_key.default.id}"]
  tags               = ["${digitalocean_tag.cluster_tag.id}"]
  private_networking = true

  connection {
    type        = "ssh"
    private_key = "${file("${path.module}/../ssh/cluster.pem")}"
    user        = "root"
    timeout     = "2m"
  }

  user_data = "${data.template_file.bootstrap_init.rendered}"

  # Upload the SSH key required to interact with the cluster.
  provisioner "file" {
    source      = "${path.module}/../ssh/cluster.pem"
    destination = "/root/cluster.pem"
  }

  # Upload the template kismatic-cluster.yaml file.
  provisioner "file" {
    source      = "${path.module}/../kismatic-cluster.yaml"
    destination = "/root/kismatic-cluster.yaml"
  }

  # Upload the Makefile to the bootstrap node.
  provisioner "file" {
    source      = "${path.module}/../Makefile"
    destination = "/root/Makefile"
  }

  # Upload the charts to the bootstrap node.
  provisioner "file" {
    source      = "${path.module}/../charts/"
    destination = "/root"
  }
}
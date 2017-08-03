# Google Developer Group Demo

A demo for my Google Developer Group (Capital-Region) talk.

The following repository will create you a Kubernetes cluster using:

1. [Digital Ocean](https://www.digitalocean.com/) for the underlying infrastructure.
2. [Terraform](https://www.terraform.io/) to create the infrastructure.
3. [Kismatic Enterprise Toolkit (v1.5.0)](https://github.com/apprenda/kismatic) for provisioning our Kubernetes cluster.

After standing up the Kubernetes cluster we will deploy the following applications:

1. [Prometheus](https://prometheus.io/)
2. [Grafana](https://grafana.com/)
3. [Fotia (Golang application used to demo Prometheus alerts)](https://github.com/swade1987/fotia)

We will then proceed to cause Prometheus to fire alerts to Slack based upon interaction with Fotia.
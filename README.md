# Google Developer Group Demo

A demo for my Google Developer Group (Capital-Region) talk.

The following repository will create you a Kubernetes cluster using:

1. [Digital Ocean](https://www.digitalocean.com/) for the underlying infrastructure.
2. [Terraform](https://www.terraform.io/) to create the infrastructure.
3. [Kismatic Enterprise Toolkit (v1.5.3)](https://github.com/apprenda/kismatic) for provisioning our Kubernetes cluster.

After standing up the Kubernetes cluster we will deploy the following applications:

1. [Prometheus](https://prometheus.io/)
2. [Grafana](https://grafana.com/)
3. [Fotia (Golang application used to demo Prometheus alerts)](https://github.com/swade1987/fotia)

We will then proceed to cause Prometheus to fire alerts to Slack based upon interaction with Fotia.

## Slides

The slides accompanying this demo can be found [here](slides/slide-deck.pdf)

## Prerequisites

A list of prerequisities for Mac can be found [here](docs/1-mac-prerequisities.md)

A list of prerequisities for Windows can be found [here](docs/2-windows-prerequisities.md)

## Cluster creation

A list of steps to build and provision the Kubernetes cluster can be found [here](docs/3-build-cluster.md)

## Helm chart deployment

A list of steps to deploy the necessary Helm charts can be found [here](docs/5-installing-prometheus-and-grafana.md)

## Pro-active alerting demo

A list of steps to demonstrate pro-active alerting can be found [here](docs/7-alerting-workflow.md)

## Cleanup (from your local machine)

To remove all the droplets from digital ocean execute the following:

```
$ make destroy-cluster
```
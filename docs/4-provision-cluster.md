# Provisioning the Kubernetes cluster

## SSH into the bootstrap node

The output from Terraform should look something like below:

```
Outputs:

bootstrap_node_ip = 178.62.20.88
etcd_node_ips = 139.59.186.190
ingress_node_ips = 139.59.182.224
master_node_ips = 139.59.190.32
storage_node_ips = 138.68.159.250,138.68.152.151
worker_node_ips = 138.68.152.231,138.68.135.238,139.59.186.112
```

Execute the following command to obtain access to the bootstrap node.

```
$ ssh -i ssh/cluster.pem root@<bootstrap_node_ip>
```

## Downloading the necessary dependencies

Execute the following command from the repo root to download Kismatic

```
$ make get-dependencies
```

## Obtain the list of IP addresses

All IP addresses used for the following steps can be found [here](https://cloud.digitalocean.com/tags/google-developer-group-demo)**

## Kismatic-cluster.yaml changes

Now update the `kismatic-cluster.yaml` in the root directory of the repo with the following changes:

This can be done by executing the following command:

```
$ nano kismatic-cluster.yaml
```

Note: There **must** be space between the `:` and the ip address you enter!

Add the IP address of Master1 to `ip`, `load_balanced_fqdn` and `load_balanced_short_name` below

```
master:
  expected_count: 1
  nodes:
  - host: master1
    ip: 192.168.1.10
  load_balanced_fqdn: 192.168.1.10
  load_balanced_short_name: 192.168.1.10
```

Update the remainder of the IP address in the `kismatic-cluster.yaml` under `etcd`, `ingress` and `worker`.

## Pre-validate the cluster using Kismatic

Once you have updated the `kismatic-cluster.yaml` file execute the following command:

```
$ make pre-validate-cluster
```

Note: The above may take some time, please be patient.

## Provision the cluster using Kismatic

If the validation step above was successful, execute the following command:

```
$ make provision-cluster
```

## Validate cluster provisioning

To validate all is well execute `kubectl get nodes`

You should be shown:

```
root@bootstrap:~# kubectl get nodes
NAME       STATUS                     AGE       VERSION
ingress1   Ready,SchedulingDisabled   8m        v1.7.4
master1    Ready,SchedulingDisabled   8m        v1.7.4
storage1   Ready,SchedulingDisabled   8m        v1.7.4
storage2   Ready,SchedulingDisabled   8m        v1.7.4
worker1    Ready                      8m        v1.7.4
worker2    Ready                      8m        v1.7.4
worker3    Ready                      8m        v1.7.4
```

# Installing Prometheus & Grafana

We now need to install Prometheus and Grafana onto the cluster, follow the steps [here](5-installing-prometheus-and-grafana.md)
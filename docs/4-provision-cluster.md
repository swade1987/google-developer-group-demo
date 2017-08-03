# Provisioning the Kubernetes cluster

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

To validate all is well execute `kubectl --kubeconfig kubeconfig get nodes`

You should be shown:

```
$  kubectl --kubeconfig kubeconfig get nodes
NAME       STATUS                     AGE       VERSION
ingress1   Ready,SchedulingDisabled   8m        v1.7.2
master1    Ready,SchedulingDisabled   8m        v1.7.2
storage1   Ready,SchedulingDisabled   8m        v1.7.2
storage2   Ready,SchedulingDisabled   8m        v1.7.2
worker1    Ready                      8m        v1.7.2
worker2    Ready                      8m        v1.7.2
worker3    Ready                      8m        v1.7.2
```
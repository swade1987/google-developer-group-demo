# Build the Kubernetes cluster

## 1. Changing cluster node location

It is possible to change the physical location of the nodes created within Digital Ocean.

This is possible by changing the `region` variable within `/terraform/variables.tf`

## 2. Create SSH keypair

Before creating our infrastructure we need to create an SSH keypair.

This key will be used by both Terraform and the Kismatic Toolkit. To create this execute:

```
$ make ssh-keypair
```

## 3. Obtain Digital Ocean Token

Before executing Terraform you need to obtain your Digital Ocean token [here](https://cloud.digitalocean.com/settings/api/tokens)

To see the changes which are going to be made execute the following commands:

Note: You will need to paste in the Digital Ocean Token during the Terraform execution.

## 4. Create Infrastructure

To create our infrastructure execute the following commands:

```
$ make cluster
```

## 5. Provisioning the Kubernetes cluster using Kismatic

To provision the cluster follow the steps [here](4-provision-cluster.md)
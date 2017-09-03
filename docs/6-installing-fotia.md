# Installing Fotia

## Installation (from the bootstrap node)

To install Fotia execute the following command:

```
$ make deploy-fotia
```

## Update hostfile (from your local machine)

We need to edit our hostfile to allow access to Fotia.

Please follow the steps below to make the necessary changes.

```
$ sudo nano /etc/hosts
```

Add the following line to the file (where 46.101.80.26 is the IP address of your ingress node):

Note: You ingress IP address can be found [here](https://cloud.digitalocean.com/tags/google-developer-group-demo)

```
46.101.80.26 fotia.example.com
```

## Validate installation

To validate everything has been successfully installed browse to the following URL: <a href="http://fotia.example.com/" target="_blank">http://fotia.example.com/</a>
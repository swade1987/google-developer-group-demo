# Installing Prometheus and Grafana

## Installation

To install Prometheus and Grafana execute the following command:

```
$ make deploy-prometheus
$ make deploy-grafana
```

## Update hostfile

We need to edit our hostfile to allow access to Prometheus, Grafana and the Alert Manager.

Please follow the steps below to make the necessary changes.

```
$ sudo nano /etc/hosts
```

Add the following lines to the file (where 46.101.80.26 is the IP address of your ingress node):

Note: You ingress IP address can be found [here](https://cloud.digitalocean.com/tags/google-developer-group-demo)

```
46.101.80.26 grafana.example.com
46.101.80.26 prometheus.example.com
46.101.80.26 alerting.example.com
```

## Validate installation

To validate everything has been successfully installed browse to the following set of URLs:

- <a href="http://grafana.example.com/" target="_blank">http://grafana.example.com/</a> (username: admin, password: admin)
- <a href="http://prometheus.example.com" target="_blank">http://prometheus.example.com</a>
- <a href="http://alerting.example.com" target="_blank">http://alerting.example.com</a>

## 5. Install Fotia

To install Fotia follow the steps [here](6-installing-fotia.md)
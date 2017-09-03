KISMATIC_VERSION=1.5.3
CURRENT_DIR = $(shell pwd)
KUBECONFIG = $(CURRENT_DIR)/kubeconfig

get-dependencies:
	@echo "Download and install Kismatic"
	wget --no-check-certificate -O - https://github.com/apprenda/kismatic/releases/download/v$(KISMATIC_VERSION)/kismatic-v$(KISMATIC_VERSION)-linux-amd64.tar.gz | tar -zx
	cp helm /usr/local/bin/helm
	cp kubectl /usr/local/bin/kubectl

ssh-keypair:
	mkdir ssh
	cd ssh && ssh-keygen -t rsa -f cluster.pem -N ""

plan-cluster:
	cd terraform && terraform plan

cluster:
	cd terraform && terraform apply

pre-validate-cluster:
	chmod 600 cluster.pem
	./kismatic install validate -f kismatic-cluster.yaml

provision-cluster:
	chmod 600 cluster.pem
	./kismatic install apply -f kismatic-cluster.yaml
	cp generated/kubeconfig .
	mkdir ~/.kube/
	cp kubeconfig ~/.kube/config

destroy-cluster:
	cd terraform && terraform destroy --force
	rm -rf ansible generated runs ssh helm kismatic kubeconfig kubectl provision

deploy-prometheus:
	@echo "Create PVs for prometheus"
	./kismatic volume add 5
	./kismatic volume add 5
	helm upgrade --install prometheus prometheus

deploy-grafana:
	@echo "Create PVs for grafana"
	./kismatic volume add 10
	helm upgrade --install grafana grafana

deploy-fotia:
	helm upgrade --install fotia fotia
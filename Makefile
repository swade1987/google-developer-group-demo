KISMATIC_VERSION=1.5.0
CURRENT_DIR = $(shell pwd)
KUBECONFIG = $(CURRENT_DIR)/kubeconfig

get-dependencies:
	@echo "Download and install Kismatic"
	wget --no-check-certificate -O - https://github.com/apprenda/kismatic/releases/download/v$(KISMATIC_VERSION)/kismatic-v$(KISMATIC_VERSION)-darwin-amd64.tar.gz | tar -zx

ssh-keypair:
	mkdir ssh
	cd ssh && ssh-keygen -t rsa -f cluster.pem -N ""

plan-cluster:
	cd terraform && terraform plan

cluster:
	cd terraform && terraform apply

pre-validate-cluster:
	chmod 600 ssh/cluster.pem
	./kismatic install validate -f kismatic-cluster.yaml

provision-cluster:
	chmod 600 ssh/cluster.pem
	./kismatic install apply -f kismatic-cluster.yaml
	cp generated/kubeconfig .

destroy-cluster:
	cd terraform && terraform destroy --force
	rm -rf ansible generated runs ssh helm kismatic kubeconfig kubectl provision
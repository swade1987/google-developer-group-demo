KISMATIC_VERSION=1.5.2
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

deploy-prometheus:
	@echo "Create PVs for prometheus"
	./kismatic volume add 5
	./kismatic volume add 5
	KUBECONFIG=$(KUBECONFIG) helm upgrade --install prometheus charts/prometheus

deploy-grafana:
	@echo "Create PVs for grafana"
	#./kismatic volume add 10
	KUBECONFIG=$(KUBECONFIG) helm upgrade --install grafana charts/grafana

deploy-fotia:
	KUBECONFIG=$(KUBECONFIG) helm upgrade --install fotia charts/fotia
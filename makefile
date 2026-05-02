BRANCH?="main"
IMAGE="ansible-sandbox"

install_ansible:
	sudo apt-add-repository -y ppa:ansible/ansible
	sudo apt-get update -y
	sudo apt-get install -y curl git software-properties-common ansible

install_docker:
	sudo apt-get update -y
	sudo apt-get install -y ca-certificates curl
	sudo install -m 0755 -d /etc/apt/keyrings
	sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
	sudo chmod a+r /etc/apt/keyrings/docker.asc
	sudo bash -c 'echo "deb [arch=$$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $$(. /etc/os-release && echo $$VERSION_CODENAME) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null'
	sudo apt-get update -y
	sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
	sudo usermod -aG docker $$USER

build:
	docker build -t $(IMAGE) .

run: 
	docker run --rm -it $(IMAGE) /bin/bash

restart:
	make build && make run

stop:
	docker kill $(IMAGE)

pull:
	ansible-pull -U https://github.com/iamgianluca/ansible.git -C $(BRANCH) --ask-become-pass

PLAYBOOK?=local.yml

playbook:
	ansible-playbook $(PLAYBOOK) --ask-become-pass

dry_run:
	ansible-playbook $(PLAYBOOK) --ask-become-pass --check

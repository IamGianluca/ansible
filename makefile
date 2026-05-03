BRANCH?="main"
IMAGE="ansible-sandbox"
IMAGE_ARCH="ansible-sandbox-arch"

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

build-ubuntu:
	docker build -t $(IMAGE) .

build-arch:
	docker build -f Dockerfile.arch -t $(IMAGE_ARCH) .

run-ubuntu:
	docker run --rm -it $(IMAGE) /bin/bash

run-arch:
	docker run --rm -it $(IMAGE_ARCH) /bin/bash

restart-ubuntu:
	make build-ubuntu && make run-ubuntu

restart-arch:
	make build-arch && make run-arch

stop:
	docker kill $(IMAGE)

pull:
	ansible-pull -U https://github.com/iamgianluca/ansible.git -C $(BRANCH) --ask-become-pass

PLAYBOOK?=ubuntu-local.yml

playbook-ubuntu:
	ansible-playbook $(PLAYBOOK) --ask-become-pass

dry-run-ubuntu:
	ansible-playbook $(PLAYBOOK) --ask-become-pass --check

playbook-arch:
	ansible-playbook arch-local.yml --ask-become-pass

dry-run-arch:
	ansible-playbook arch-local.yml --ask-become-pass --check

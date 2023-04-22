BRANCH?="main"
IMAGE="boat"

install_ansible:
	sudo apt-add-repository -y ppa:ansible/ansible
	sudo apt-get update -y
	sudo apt-get install -y curl git software-properties-common ansible

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

playbook:
	ansible-playbook local.yml

playbook_local:
	ansible-playbook local.yml --ask-become-pass

install_ansible:
	sudo apt-add-repository -y ppa:ansible/ansible
	sudo apt-get update -y
	sudo apt-get install -y curl git software-properties-common ansible

ansible_pull:
	ansible-pull -U https://github.com/iamgianluca/ansible.git

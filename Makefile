build-centos:
	docker build --rm --no-cache -t work:centos .

prepare:
	cp roles/user/vars/main.yml.example roles/user/vars/main.yml
	echo -e "[all]\nlocalhost ansible_user=root" > inventory

provision:
	ansible-playbook -i inventory playbook.yml

provision-dockerized:
	docker run -ti --rm --volume "${SSH_AUTH_SOCK}:/ssh-agent" --env SSH_AUTH_SOCK=/ssh-agent -v "${PWD}:/var/ansible-playbooks" ansible:latest ansible-playbook -i inventory playbook.yml

docker-image:
	docker build --rm --no-cache -t work-machine:centos .

prepare:
	mkdir -p roles/user/vars
	cp -f roles/user/defaults/main.yml roles/user/vars/main.yml
	echo -e "[all]\nlocalhost ansible_connection=local" > inventory

test:
	ansible-playbook -i inventory playbook.yml --check --diff

provision:
	ansible-playbook -i inventory playbook.yml --diff

provision-dockerized:
	docker run -ti --rm --volume "${SSH_AUTH_SOCK}:/ssh-agent" --env SSH_AUTH_SOCK=/ssh-agent -v "${PWD}:/var/ansible-playbooks" ansible:latest ansible-playbook -i inventory playbook.yml --diff

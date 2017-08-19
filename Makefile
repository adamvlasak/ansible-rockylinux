provision:
	ansible-playbook -i inventory playbook.yml

provision-dockerized:
	docker run -ti --rm --volume "${SSH_AUTH_SOCK}:/ssh-agent" --env SSH_AUTH_SOCK=/ssh-agent -v "${PWD}:/var/ansible-playbooks" ansible:latest ansible-playbook -i inventory playbook.yml

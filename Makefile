test:
	ansible-playbook playbook.yml --check --diff

provision:
	ansible-playbook playbook.yml --diff

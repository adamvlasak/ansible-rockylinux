docker-image:
	docker build --rm --no-cache -t work-machine:centos .

prepare:
	mkdir -p roles/user/vars
	cp -f roles/user/defaults/main.yml roles/user/vars/main.yml
	mkdir -p roles/security/vars
	touch roles/security/vars/main.yml
	echo -e "[all]\nlocalhost ansible_connection=local" > inventory

test:
	ansible-playbook -i inventory playbook.yml --check --diff

provision:
	ansible-playbook -i inventory playbook.yml --diff


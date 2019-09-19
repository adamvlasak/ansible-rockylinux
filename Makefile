docker.run:
	docker-compose up -d --build

docker.stop:
	docker-compose down

recreate: docker.stop docker.run

test:
	ansible-playbook playbook.yml --check --diff

provision:
	ansible-playbook playbook.yml --diff

provision.vim:
	ansible-playbook playbook.yml -t vim --diff

provision.network:
	ansible-playbook playbook.yml -t network --diff

provision.docker:
	ansible-playbook playbook.yml -t docker --diff

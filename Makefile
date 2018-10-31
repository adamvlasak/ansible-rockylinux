docker-run: docker-image
	docker-compose up -d

docker-image:
	docker build --rm -t work-machine:latest .

clean:
	docker-compose down

recreate: clean docker-run

prepare:
	cp -f vars.example vars.yml
	mkdir -p roles/user/files/
	cp ~/.ssh/id_rsa* roles/user/files/
	echo "Do not forget to create hosts file!"

test:
	ansible-playbook playbook.yml --check --diff

provision:
	ansible-playbook playbook.yml --diff


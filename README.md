# working machine

## Overview

This project provisions your CentOS based OS for better user experience.

## Creating machine with Docker (optional)

- you need docker

	$ docker-compose up -d --build

You can try to connect via SSH like so to test it:

    $ ssh root@localhost

And it should work.

## Creating machine with Vagrant and VirtualBox (optional)

- you need Vagrant
- you need VirtualBox
- you need Vagrantfile (see below)

```ruby
# -*- mode: ruby -*-
# vi: set ft=ruby :

$script = <<SCRIPT
yum clean all
yum install -y epel-release
yum install -y \
	ansible \
	bash-completion \
	bash-completion-extra \
	curl \
	git \
	htop \
	iftop \
	tig \
	tmux \
	vim \
	wget
yum clean all
SCRIPT

Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"
  config.vm.hostname = "work"
  config.vm.network "public_network"
  config.vm.network "private_network", ip: "192.168.33.10"
  config.vm.synced_folder ".", "/vagrant", disabled: true
  config.vm.provision "shell", inline: $script
end
```

This Vagrantfile is included in this repository.

To run machine simply do:

	$ cd /path/to/work-machine
	$ vagrant up

## Provisioning via ansible

This step assumes you can SSH to your machine, you know its IP address and it runs CentOS.

    $ cd work-machine/
    $ make prepare
    $ cat ~/.ssh/id_rsa.pub # you will need it in user.yml

You must edit the file in vars/user.yml according to your needs! Then run playbook:

    $ make provision

Done!

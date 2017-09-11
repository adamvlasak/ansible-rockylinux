# working machine

## Overview

This project provisions your CentOS based OS for better user experience.

## Creating machine with Docker (optional)

- you need docker

```$ docker-compose up -d --build```

You can try to connect via SSH like so to test it:

```$ ssh root@localhost```

And it should work.

## Creating machine with Vagrant and VirtualBox (optional)

- you need Vagrant
- you need VirtualBox
- you need Vagrantfile (see below)

```ruby
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"
  config.vm.hostname = "work"
  config.vm.synced_folder ".", "/vagrant", disabled: true

  config.vm.provision "shell" do |s|
    ssh_pub_key = IO.readlines("#{Dir.home}/.ssh/id_rsa.pub").first.strip
    s.inline = <<-SCRIPT
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
            net-tools \
            tig \
            tmux \
            traceroute \
            vim \
            wget
        yum clean all

        mkdir -p /root/.ssh
        chmod 0600 /root/.ssh
        echo #{ssh_pub_key} > /root/.ssh/id_rsa.pub
        echo #{ssh_pub_key} > /root/.ssh/authorized_keys
        chmod 0400 /root/.ssh/*
    SCRIPT
  end

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "2048"
  end
end
```

This Vagrantfile is included in this repository.

To run machine simply do:

	$ cd /path/to/work-machine
	$ vagrant up

You can try to connect via SSH like so to test it:

```$ ssh root@localhost -p 2222```

And it should work.

None: on Windows you can use command ```vagrant putty```.

## Provisioning via ansible

This step assumes you can SSH to your machine, you know its IP address and it runs CentOS.

    $ cd work-machine/
    $ make prepare
    $ cat ~/.ssh/id_rsa.pub # you will need it in user.yml

You must edit the file in vars/user.yml according to your needs! Then run playbook:

    $ make provision

Done!

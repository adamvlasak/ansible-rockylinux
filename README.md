# working machine

## Overview

This project provisions your CentOS based OS for better user experience.

## Creating machine with Docker (optional)

- you need docker
- you need Dockefile (see below)

```Dockerfile
FROM library/centos:7

RUN yum update -y; yum install -y epel-release; yum clean all
RUN yum install -y \
        ansible \
        curl \
        deltarpm \
        bind-utils \
        git \
        net-tools \
        openssh-server \
        passwd \
        python \
        vim \
        wget && \
    yum clean all

RUN ln -sf /usr/share/zoneinfo/Europe/Prague /etc/localtime

ADD roles/user/files/id_rsa /root/.ssh/id_rsa
ADD roles/user/files/id_rsa.pub /root/.ssh/id_rsa.pub
ADD roles/user/files/id_rsa.pub /root/.ssh/authorized_keys

ADD roles/user/templates/vars.sh /etc/profile.d/vars.sh
ADD roles/tools/files/setup.sh /root/setup.sh

RUN chmod 0700 /root/.ssh; chmod 0600 /root/.ssh/*
RUN mkdir /var/run/sshd

RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N ''

EXPOSE 22
ENTRYPOINT ["/usr/sbin/sshd", "-D"]
```

```$ docker-compose up -d --build```

You can try to connect via SSH like so to test it:

```$ ssh root@localhost -p 2222```

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
            bind-utils \
            curl \
            deltarpm \
            git \
            net-tools \
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

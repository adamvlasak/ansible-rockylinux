# working machine

## Overview

This project provisions your CentOS based OS for better user experience.

## Creating machine with Docker (optional)

- you need docker
- you need Dockefile (see project root)
- you need docker-compose (see project root)

```
$ cd /path/to/work-machine
$ make docker-image
$ make docker-run
$ docker-compose ps
$ docker inspect <ID> # grab IP and add connection to inventory
$ ssh root@<IP> # password here is docker
$ make provision
```

You can try to connect via SSH like so to test it:

```$ ssh root@<IP>```

And it should work.

## Creating machine with Vagrant and VirtualBox (optional)

- you need Vagrant
- you need VirtualBox
- you need Vagrantfile (see project root)

To run machine simply do:

```
$ cd /path/to/work-machine
$ vagrant up
```

You can try to connect via SSH like so to test it:

```$ ssh root@localhost -p 2222```

And it should work.

None: on Windows you can use command ```vagrant putty```.

## Provisioning via ansible

This step assumes you can SSH to your machine, you know its IP address and it runs CentOS.

```
$ cd work-machine/
$ make prepare
$ cat ~/.ssh/id_rsa.pub # you will need it in user.yml
```

You must edit the file in vars/user.yml according to your needs! Then run playbook:

```
$ make provision
```

Done!

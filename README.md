# working machine

## Overview

This project provisions your CentOS based OS for better user experience.

## Creating machine (optional)

You need docker.

To build CentOS image:

    $ cd /path/to/work-machine
    $ docker build --rm -t work:centos .

To run machine:

    $ cd /path/to/work-machine
    $ docker-compose up -d

You can try to connect via SSH like so to test it:

    $ ssh root@localhost

And it should work.

## Provisioning via ansible

This step assumes you can SSH to your machine, you know its IP address and it runs CentOS.

    $ cd work-machine/
    $ make prepare
    $ cat ~/.ssh/id_rsa.pub # you will need it in user.yml

You must edit the file in vars/user.yml according to your needs! Then run playbook:

    $ make provision

Done!

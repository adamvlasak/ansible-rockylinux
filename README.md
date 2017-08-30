# working machine

## Overview

This project provisions your debian based OS for better user experience.

## Creating machine (optional)

You need docker.

To build debian image:

    $ cd /path/to/work-machine
    $ docker build --rm -t work:debian .

To build centos image:

    $ cd /path/to/work-machine
    $ docker build --rm -t work:centos .

To run machine:

    $ cd /path/to/work-machine
    $ docker-compose up -d

Note: you can edit image in docker-compose.yml to run centos version

You can try to connect via SSH like so to test it:

    $ ssh root@localhost

And it should work.

## Provisioning via ansible

    $ cd work-machine/
    $ make prepare

You must edit the file in vars/user.yml according to your needs! Then run playbook:

    $ make provision

Done!

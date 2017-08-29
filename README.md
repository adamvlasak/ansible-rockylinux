# working machine

## Overview

This project provisions your debian based OS for better user experience.

## Creating machine (optional)

You need docker.

To build image:

    $ cd /path/to/work-machine
    $ docker build --rm -t work:latest .

To run machine:

    $ cd /path/to/work-machine
    $ docker-compose up -d

You can try to connect via SSH like so:

    $ ssh root@localhost

And it should work.

## Provisioning via ansible

    $ cd work-machine/
    $ cp vars/user.example vars.yml
    $ touch inventory # add your own server

You must edit the file in vars/user.yml according to your needs! Then run playbook:

    $ make provision

Done!

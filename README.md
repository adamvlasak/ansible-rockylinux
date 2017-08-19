# working machine

## Overview

This project provisions your debian based OS for better user experience.

## How to install ansible via pip

    $ apt-get update
    $ apt-get install curl wget vim git tig build-essential sudo python-virtualenv python-crypto python-setuptools python-dev libffi-dev libssl-dev
    $ cd work-machine/
    $ virtualenv .
    $ . bin/activate
    $ pip install ansible

## Provisioning

    $ cd work-machine/
    $ cp vars/user.example vars.yml
    $ touch inventory # add your own server

You must edit the file in vars/user.yml according to your needs! Then run playbook:

    $ make provision

or

    $ make provision-dockerized

Done!

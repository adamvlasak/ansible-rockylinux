# Linux Work machine

## Overview

This project provisions your Rocky Linux based OS for better user experience.
Optimized for ansible 2.7+

## Provisioning via ansible

This step assumes you have root access, you can SSH to your machine, you know its IP address and it runs Rocky Linux. Please copy your id_rsa, id_rsa.pub and create authorized_keys in your /root/.ssh directory.

```
$ dnf install git vim ansible
$ mkdir src && cd src
$ git clone git@github.com:adamvlasak/work-machine.git
$ cd work-machine/
$ touch hosts
$ cp vars.example vars.yml
```

You must create two files: hosts and vars.yml in root of the project and set up according to your needs (see vars.example). Then run playbook:

```
$ make provision
```

Done!

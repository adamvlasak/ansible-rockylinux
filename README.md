# Linux Work machine

## Overview

This project provisions your Rocky Linux based OS for better user experience.
Optimized for ansible 2.7+

## Provisioning via ansible

This step assumes you have root access, you can SSH to your machine, you know its IP address and it runs Rocky Linux. Please copy your id_rsa, id_rsa.pub and create authorized_keys in your /root/.ssh directory.

```
$ git clone git@github.com:adamvlasak/ansible-rockylinux.git
$ cd work-machine/
$ echo "homelab.loc ansible_user=root ansible_host=<IP>" > hosts
$ cp vars.example vars.yml
```
Edit `vars.yml` to your liking.

```
$ make provision
```

Done!

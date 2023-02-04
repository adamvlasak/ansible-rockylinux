# Rocky Linux Dev Box

## Overview

This project configures your Rocky Linux based OS for better user experience.

## Provisioning via ansible

This step assumes you have root access, you can SSH to your machine, you know
its IP address and it runs Rocky Linux. Please put your public key to
`/root/.ssh/authorized_keys` file.

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

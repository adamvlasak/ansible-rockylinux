# Rocky Linux Dev Box

## Overview

This project configures your Rocky Linux based OS for better user experience.

## Install

```
$ python3 -m venv .env/
$ . .env/bin/activate
$ pip install -r requirements.txt
```

## Provisioning via ansible

This step assumes you have root access, you can SSH to your machine, you know
its IP address and it runs Rocky Linux. Please put your public key to
`/root/.ssh/authorized_keys` file.

```
$ echo "homelab.loc ansible_user=root ansible_host=<IP>" > hosts
$ cp vars.example vars.yml
```
Edit `vars.yml` to your liking.

```
$ make provision
```

Done!

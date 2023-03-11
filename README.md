# Rocky Linux Dev Box

## Overview

This project configures your Rocky Linux 9+ based OS for better user experience.

Each role in `playbook.yml` uses variables you can change (most important ones are listed below):
```
---
hostname: example.org           # set when you're not running in  WSL

docker_enabled: false           # this will install docker and docker compose v2 plugin
kubernetes_enabled: false       # this will install minikube and kubectl tools
hashicorp_tools_enabled: false  # this will install packer, terraform and terragrunt tools
wsl2: false                     # set to true when you're running in WSL
configure_ssh_agent: false      # for easier secure shell logins

user:
  login: "johndoe"              # user of this name will be created
  groups:                       # user will be part of this groups
    - users
    - wheel                     # you can use sudo without password
    - docker                    # do not set docker group when you're not installing docker
  email: "john@doe.org"         # used in .gitconfig
  fullname: "John Doe"          # used in .gitconfig
  ssh_pubkey: "..."             # set ONLY when you work with remote machine over SSH (delete otherwise)
...
```
There are more variables (see `vars.yml.example`). To be able to run this playbook please make a copy of `vars.yml.example` with following command:
```
$ cp vars.example vars.yml
```
and edit to your liking.

## Install ansible and other tools using python3 venv

```
$ python3 -m venv .env/
$ . .env/bin/activate
$ pip install -r requirements.txt
```
Now you can see `ansible`, `ansible-lint`, `yamllint` and `molecule` commands.

## Run the playbook

When you're configuring WSL based distro, create following ansible inventory:
```
$ echo "localhost ansible_connection=local" > hosts
```
When you're configuring remote machine over SSH, make sure you have your public key set:
```
$ ssh-copy-id root@machine
```
and use following ansible inventory:
```
$ echo "hostname.org ansible_user=root ansible_host=<IP>" > hosts
```
Then you can run this playbook:
```
$ ansible-playbook playbook.yml --diff
or
$ ansible-playbook playbook.yml --diff --check # to see how the play will look like
```

Done!

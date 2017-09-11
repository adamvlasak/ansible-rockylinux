# -*- mode: ruby -*-
# vi: set ft=ruby :

$script = <<SCRIPT
yum clean all
yum install -y epel-release
yum install -y \
	ansible \
	bash-completion \
	bash-completion-extra \
	curl \
	git \
	htop \
	iftop \
	tig \
	tmux \
	vim \
	wget
yum clean all
SCRIPT

Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"
  config.vm.hostname = "work"
  config.vm.network "public_network"
  config.vm.network "private_network", ip: "192.168.33.10"
  config.vm.synced_folder ".", "/vagrant", disabled: true
  config.vm.provision "shell", inline: $script
end

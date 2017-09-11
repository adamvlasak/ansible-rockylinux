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
	net-tools \
	tig \
	tmux \
	traceroute \
	vim \
	wget
yum clean all
SCRIPT

Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"
  config.vm.hostname = "work"
  config.vm.network "forwarded_port", guest: 22, host: 2222
  config.vm.synced_folder ".", "/vagrant", disabled: true
  config.vm.provision "shell", inline: $script
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "2048"
  end
end

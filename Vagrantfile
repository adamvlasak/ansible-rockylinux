# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"
  config.vm.hostname = "work"
  config.vm.synced_folder ".", "/vagrant", disabled: true

  config.vm.provision "shell" do |s|
    ssh_pub_key = IO.readlines("#{Dir.home}/.ssh/id_rsa.pub").first.strip
    s.inline = <<-SCRIPT
        yum clean all
        yum install -y epel-release
        yum install -y \
            ansible \
            bind-utils \
            curl \
            deltarpm \
            git \
            net-tools \
            traceroute \
            vim \
            wget
        yum clean all

        mkdir -p /root/.ssh
        chmod 0600 /root/.ssh
        echo #{ssh_pub_key} > /root/.ssh/id_rsa.pub
        echo #{ssh_pub_key} > /root/.ssh/authorized_keys
        chmod 0400 /root/.ssh/*
    SCRIPT
  end

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "2048"
  end
end

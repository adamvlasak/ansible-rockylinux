# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"
  config.vm.hostname = "work"
  config.vm.network "forwarded_port", guest: 22, host: 2222
  config.vm.synced_folder ".", "/vagrant", disabled: true

  config.vm.provision "shell" do |s|
    ssh_pub_key = File.readlines("#{Dir.home}/.ssh/id_rsa.pub").first.strip
    s.inline = <<-SCRIPT
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

        mkdir -p /home/vagrant/.ssh
        chmod 0600 /home/vagrant/.ssh
        echo #{ssh_pub_key} >> /home/vagrant/.ssh/authorized_keys
        chmod 0400 /home/vagrant/.ssh/authorized_keys
        mkdir -p /root/.ssh
        chmod 0600 /root/.ssh
        echo #{ssh_pub_key} >> /root/.ssh/authorized_keys
        chmod 0400 /root/.ssh/authorized_keys
    SCRIPT
  end

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "2048"
  end
end

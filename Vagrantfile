# Defines our Vagrant environment
#
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  # create mgmt node
  config.vm.define :mgmt do |mgmt_config|
      mgmt_config.vm.box = "bento/centos-7.2"
      mgmt_config.vm.hostname = "mgmt"
      mgmt_config.vm.network :private_network, ip: "10.0.15.10"
      mgmt_config.vm.provider "virtualbox" do |vb|
        vb.memory = "256"
      end
      mgmt_config.vm.provision :shell, path: "bootstrap-mgmt.sh"
  end

  # create master 
  config.vm.define :master do |master_config|
      master_config.vm.box = "bento/centos-7.2"
      master_config.vm.hostname = "master"
      master_config.vm.network :private_network, ip: "10.0.15.11"
      master_config.vm.network "forwarded_port", guest: 80, host: 8080
      master_config.vm.provider "virtualbox" do |vb|
        vb.memory = "1024"
      end
      master_config.vm.provision :shell, path: "bootstrap-nodes.sh"
  end

  # create some minions
  # https://docs.vagrantup.com/v2/vagrantfile/tips.html
  (1..2).each do |i|
    config.vm.define "minion-#{i}" do |node|
        node.vm.box = "bento/centos-7.2"
        node.vm.hostname = "minion-#{i}"
        node.vm.network :private_network, ip: "10.0.15.2#{i}"
        node.vm.network "forwarded_port", guest: 80, host: "808#{i}"
        node.vm.provider "virtualbox" do |vb|
          vb.memory = "512"
        end
        node.vm.provision :shell, path: "bootstrap-nodes.sh"
    end
  end

end

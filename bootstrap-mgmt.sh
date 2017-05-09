#!/usr/bin/env bash

# install ansible (http://docs.ansible.com/intro_installation.html)
yum install -y epel-release.noarch
yum -y update
yum install -y ansible


mkdir /home/vagrant/ansible
ln -s /vagrant/ansible /home/vagrant/ansible

cp /home/vagrant/ansible/keys/{public,private} /home/vagrant/.ssh/

# configure hosts file for our internal network defined by Vagrantfile
cat >> /etc/hosts <<EOL

# vagrant environment nodes
10.0.15.10  mgmt
10.0.15.11  master
10.0.15.21  minion-1
10.0.15.22  minion-2
EOL

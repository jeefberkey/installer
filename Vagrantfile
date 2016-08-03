# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "jhcook/fedora24"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "2048"
    vb.cpus   = "2"
  end

  config.vm.provision "shell", inline: <<-SHELL
    rpm -ivh https://yum.puppetlabs.com/puppetlabs-release-pc1-fedora-24.noarch.rpm
    sudo dnf install -y deltarpm vim git wget ruby rubygem-puppet-lint tree htop puppet-agent
  SHELL
end

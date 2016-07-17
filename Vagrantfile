# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "box-cutter/fedora23"

  config.vm.provider "virtualbox" do |vb|
    # Customize the amount of memory on the VM:
    vb.memory = "2048"
    vb.cpus   = "2"
  end

  config.vm.provision "shell", inline: <<-SHELL
    sudo dnf install -y deltarpm vim git wget ruby rubygem-puppet-lint tree htop
    sudo gem install puppet bundler
    /usr/local/share/gems/gems/puppet-4.3.1/install.rb 1>&2 /dev/null
    cd /vagrant
    /usr/local/bin/bundle
  SHELL
end

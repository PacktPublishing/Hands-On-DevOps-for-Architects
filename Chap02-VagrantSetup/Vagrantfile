# Bob Aiello
# This vagrant files sets up two nodes - one to host ansible and the second
# to host Wildfly our webserver.

# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  # config.vm.box = "ubuntu/trusty64"
  config.vm.box = "ubuntu/trusty64"
  # We are exposing ports 8080 and 9990 by forwarding them
  config.vm.network "forwarded_port", guest: 9990, host: 9990,
      auto_correct: true
  config.vm.network "forwarded_port", guest: 8080, host: 8080,
      auto_correct: true

  # anscntl is our Ansible node
  config.vm.define "ansctl" do |ansctl|
    ansctl.vm.box = "ubuntu/trusty64"
    ansctl.vm.hostname = 'ansctl'
    ansctl.vm.box_url = "ubuntu/trusty64"

    ansctl.vm.network :public_network, ip: "192.168.100.100"
    ansctl.vm.network "forwarded_port", guest: 8080, host: 8080,
        auto_correct: true
    ansctl.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--memory", 1024]
      v.customize ["modifyvm", :id, "--name", "ansctl"]
    end
  end

  # web will be the node hosting Wildfly
  config.vm.define "web" do |web|
    web.vm.box = "ubuntu/trusty64"
    web.vm.hostname = 'web'
    web.vm.box_url = "ubuntu/trusty64"

    web.vm.network :public_network, ip: "192.168.100.101"
    web.vm.network "forwarded_port", guest: 9990, host: 9990,
        auto_correct: true
    web.vm.network "forwarded_port", guest: 8080, host: 8080,
        auto_correct: true

    web.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--memory", 1024]
      v.customize ["modifyvm", :id, "--name", "web"]
    end
  end


end

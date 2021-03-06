# -*- mode: ruby -*-
# vi: set ft=ruby :
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Beginning of vm "modsecurity1" configuration section
  config.vm.define "modsecurity1" do |server|
    server.vm.box = "centos64"
    server.vm.box_url = "https://github.com/2creatives/vagrant-centos/releases/download/v6.4.2/centos64-x86_64-20140116.box"
    server.vm.network :private_network, ip: "10.10.0.11"
    server.vm.hostname = "modsecurity1.charlymps.com"
    server.vm.provision :ansible do |ansible|
      ansible.playbook = "provision_modsecurity1.yml"
      # This is required because to prevent Host key checking errors when the vagrant machine is recreated with another key
      ansible.host_key_checking = false
    end
  end

  # Beginning of vm "modsecurity2" configuration section
  config.vm.define "modsecurity2" do |server|
    server.vm.box = "centos64"
    server.vm.box_url = "https://github.com/2creatives/vagrant-centos/releases/download/v6.4.2/centos64-x86_64-20140116.box"
    server.vm.network :private_network, ip: "10.10.0.12"
    server.vm.hostname = "modsecurity2.charlymps.com"
    server.vm.provision :ansible do |ansible|
      ansible.playbook = "provision_modsecurity2.yml"
      # This is required because to prevent Host key checking errors when the vagrant machine is recreated with another key
      ansible.host_key_checking = false
    end
  end

  # Beginning of vm "modsecurity3" configuration section
  config.vm.define "modsecurity3" do |server|
    server.vm.box = "centos64"
    server.vm.box_url = "https://github.com/2creatives/vagrant-centos/releases/download/v6.4.2/centos64-x86_64-20140116.box"
    server.vm.network :private_network, ip: "10.10.0.13"
    server.vm.hostname = "modsecurity3.charlymps.com"
    server.vm.provision :ansible do |ansible|
      ansible.playbook = "provision_modsecurity3.yml"
      # This is required because to prevent Host key checking errors when the vagrant machine is recreated with another key
      ansible.host_key_checking = false
    end
  end

  # Beginning of vm "modsecurity4" configuration section
  config.vm.define "modsecurity4" do |server|
    server.vm.box = "centos64"
    server.vm.box_url = "https://github.com/2creatives/vagrant-centos/releases/download/v6.4.2/centos64-x86_64-20140116.box"
    server.vm.network :private_network, ip: "10.10.0.14"
    server.vm.hostname = "modsecurity4.charlymps.com"
    server.vm.provision :ansible do |ansible|
      ansible.playbook = "provision_modsecurity4.yml"
      # This is required because to prevent Host key checking errors when the vagrant machine is recreated with another key
      ansible.host_key_checking = false
    end
  end

  # Beginning of vm "modsecurity5" configuration section
  config.vm.define "modsecurity5" do |server|
    server.vm.box = "centos64"
    server.vm.box_url = "https://github.com/2creatives/vagrant-centos/releases/download/v6.4.2/centos64-x86_64-20140116.box"
    server.vm.network :private_network, ip: "10.10.0.15"
    server.vm.hostname = "modsecurity5.charlymps.com"
    server.vm.provision :ansible do |ansible|
      ansible.playbook = "provision_modsecurity5.yml"
      # This is required because to prevent Host key checking errors when the vagrant machine is recreated with another key
      ansible.host_key_checking = false
    end
  end

  # Beginning of vm "waffle" configuration section
  config.vm.define "waffle" do |server|
    server.vm.box = "centos70"
    server.vm.box_url = "https://f0fff3908f081cb6461b407be80daf97f07ac418.googledrive.com/host/0BwtuV7VyVTSkUG1PM3pCeDJ4dVE/centos7.box"
    server.vm.network :private_network, ip: "10.10.0.3"
    server.vm.hostname = "waffle.charlymps.com"
    server.vm.synced_folder ".", "/vagrant", disabled: true
    server.vm.provision :ansible do |ansible|
      ansible.playbook = "provision_waffle.yml"
      # This is required because to prevent Host key checking errors when the vagrant machine is recreated with another key
      ansible.host_key_checking = false
    end
  end

  # Beginning of vm "auditconsole" configuration section
  config.vm.define "auditconsole" do |server|
    server.vm.box = "centos64"
    server.vm.box_url = "https://github.com/2creatives/vagrant-centos/releases/download/v6.4.2/centos64-x86_64-20140116.box"
    server.vm.network :private_network, ip: "10.10.0.4"
    server.vm.hostname = "auditconsole.charlymps.com"
    server.vm.provider "virtualbox" do |vbox|
      vbox.memory = 2048
      vbox.customize ["modifyvm", :id, "--ioapic", "on"]
      vbox.customize ["modifyvm", :id, "--cpus", "1"]
    end
    server.vm.provision :ansible do |ansible|
      ansible.playbook = "provision_auditconsole.yml"
      # This is required because to prevent Host key checking errors when the vagrant machine is recreated with another key
      ansible.host_key_checking = false
    end
  end

  # Beginning of vm "nginx" configuration section
  config.vm.define "nginx" do |server|
    server.vm.box = "centos64"
    server.vm.box_url = "https://github.com/2creatives/vagrant-centos/releases/download/v6.4.2/centos64-x86_64-20140116.box"
    server.vm.network :private_network, ip: "10.10.0.16"
    server.vm.hostname = "nginx.charlymps.com"
    server.vm.provision :ansible do |ansible|
      ansible.playbook = "ansible/nginx.yml"
      # This is required because to prevent Host key checking errors when the vagrant machine is recreated with another key
      ansible.host_key_checking = false
    end
  end

end

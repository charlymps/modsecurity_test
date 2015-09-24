# -*- mode: ruby -*-
# vi: set ft=ruby :
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Beginning of vm "modsecurity1" configuration section
  config.vm.define "modsecurity1" do |server|
    server.vm.box = "centos64"
    server.vm.box_url = "https://github.com/2creatives/vagrant-centos/releases/download/v6.4.2/centos64-x86_64-20140116.box"
    server.vm.network :private_network, ip: "10.10.0.2"
    server.vm.hostname = "modsecurity1.charlymps.com"
    server.vm.provision :ansible do |ansible|
      ansible.playbook = "provision_modsecurity1.yml"
      # This is required because to prevent Host key checking errors when the vagrant machine is recreated with another key
      ansible.host_key_checking = false
    end
  end

end

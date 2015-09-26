# modsecurity_test

This project deploys via Vagrant/Ansible a group of virtual machines you can use to test modsecurity and some tools to monitor its behaviour.

Currently it deploys these machines:
- modsecurity1, which is a CentOS 6 server with Apache and modsecurity installed from EPEL repositories.
- waffle, which is a CentOS 6 server with Apache, MySQL and the WAF-FLE modsecurity console (http://waf-fle.org/)

About the project

While I have more experience with Puppet, I chose Ansible as the provisioning tool because it gave me the felixibility of not having to install an agent in the base image.

Install

I tried to do this as self contained as possible. To have this environment up and running you just need:
- Vagrant
- VirtualBox
- Ansible
- Internet connection ;)

Just clone this project in any directory, for example:

git clone git@github.com:charlymps/modsecurity_test.git modsecurity_test

Then change directory into the downloaded repository and run vagrant inside it.

cd modsecurity_test
vagrant up

Vagrant should deploy the machines inside the private network 10.10.0.0/24, so you will use that network to reach them.


# modsecurity_test

This project deploys via Vagrant/Ansible a group of virtual machines you can use to test modsecurity and some tools to monitor its behaviour.

Currently it deploys these machines:
- modsecurity1, which is a CentOS 6 server with Apache and modsecurity installed from EPEL repositories.
- waffle, which is a CentOS 6 server with Apache, MySQL and the WAF-FLE modsecurity console (http://waf-fle.org/)

## About the project

While I have more experience with Puppet, I chose Ansible as the provisioning tool because it gave me the flexibility of not having to install an agent in the base image.

## Install

I tried to do this as self contained as possible. To have this environment up and running you just need:
- Vagrant
- VirtualBox
- Ansible
- Internet connection ;)

Just clone this project in any directory, for example:

````
git clone git@github.com:charlymps/modsecurity_test.git modsecurity_test
````

Then change directory into the downloaded repository and run vagrant inside it.
````
cd modsecurity_test
vagrant up
````

Vagrant should deploy the machines inside the private network 10.10.0.0/24, so you will use that network to reach them.

## Webserver configuration
Currently, the webserver installed on the machine modsecurity1 listens in IP address 10.10.0.2 and it has 2 Virtual Hosts:
- site1.charlymps.com, which has modsecurity enabled
- site2.charlymps.com, which has modsecurity in "DetectionOnly" mode

## WAF-FLE configuration
The 'waffle' server was installed using the deployment guide available in http://www.waf-fle.org/downloads/waf-fle_0.6.3-deployment_guide.pdf. MySQL is configured with the root password 'waffle', so you should run the installation script by opening http://10.10.0.3/waf-fle in your browser and continue the installation steps from there.

## How to test

First of all I suggest to add site1.charlymps.com and site2.charlymps.com to the /etc/hosts of your local machine, it will make your testing task easier.

modsecurity logs all its events to /var/log/httpd/modsecurity_audit.log. An easy way to test it is by using the tool https://cirt.net/Nikto2, which scans a website for different patterns of attack.
For example you could use:
````
perl nikto.pl site1.charlymps.com
````


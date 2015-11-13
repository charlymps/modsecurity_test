# modsecurity_test

This project deploys via Vagrant/Ansible a group of virtual machines you can use to test modsecurity and some tools to monitor its behaviour.

Currently it deploys these machines:
- modsecurity1, a CentOS 6 server with Apache and modsecurity installed from EPEL repositories. It has mlogc installed and configured to send events to waffle in pipe mode.
- modsecurity2, a CentOS 6 server with Apache and modsecurity installed from EPEL repositories. It has mlogc installed and configured to send events to waffle in cron mode.
- modsecurity3, a CentOS 6 server with Apache and modsecurity installed from EPEL repositories. It has mlogc2waffle installed and configured to send events to waffle in service mode.
- modsecurity4, a CentOS 6 server with Apache and modsecurity installed from EPEL repositories. It has mlog2wafle installed and configured to send events to waffle in cron mode.
- modsecurity5, a CentOS 6 server with Apache and modsecurity installed from EPEL repositories. It has mlogc installed and configured to send events to auditconsole in cron mode.
- nginx, a CentOS 6 server with Nginx and modsecurity built from source. It has mlogc installed and configured to send events to waffle in cron mode.
- waffle, a CentOS 6 server with Apache, MySQL and the WAF-FLE modsecurity console (http://waf-fle.org/)
- auditconsole, a CentOS 6 server with openjdk-1.6.0, tomcat6, MySQL and the AuditConsole (https://jwall.org/web/audit/console/index.jsp) installed from war file.

## About the project

While I have more experience with Puppet, I chose Ansible as the provisioning tool because it gave me the flexibility of not having to install an agent in the base image.

## Install

I tried to make this work "out of the box" to save me time setting up my test lab. This means in most case the machines download the installers from the Internet on provisioning
time. To have this environment up and running you just need:
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

This project has grown in the last weeks from 3 machines to 8. As that could take more resources than necessary on the host (maybe you only want to use 3 of the machines for
your test) I suggest to only deploy the machines you need. Vagrant allows you to specify which machines to deploy.

For example if you want to deploy only the machines 'modsecurity1' and 'modsecurity2' you will have to use this command:

```
vagrant up modsecurity1 modsecurity2
```

## Webserver configuration
Currently, the webserver installed on the machine modsecurity1 listens in IP address 10.10.0.2 and it has 2 Virtual Hosts:
- site1.charlymps.com, which has modsecurity enabled
- site2.charlymps.com, which has modsecurity in "DetectionOnly" mode

Machines modsecurity2, modsecurity3, modsecurity4 and modsecurity5 also hae these virtualhosts defined. Machine nginx defines no virtual hosts.

## WAF-FLE configuration
The 'waffle' server was installed using the deployment guide available in http://www.waf-fle.org/downloads/waf-fle_0.6.3-deployment_guide.pdf. MySQL is configured with the root password 'waffle', so you should run the installation script by opening http://10.10.0.3/waf-fle in your browser and continue the installation steps from there.
The installer will ask you to provide an username and password for creating the database. You must provide 'root' and 'waffle'. After that, the installer will ask you to disable the installation,
you can do that by logging into the 'waffle' machine, editing /usr/local/waffle/config.php.
```
vagrant ssh waffle
sed -i "" 's/$SETUP = true/$SETUP = false/' /usr/local/waf-fle/config.php
```

Before doing any testing you must log in to the WAF-FLE interface and add the sensors you are going to use.

## AuditConsole configuration ##

TODO

## How to test

First of all I suggest to add site1.charlymps.com and site2.charlymps.com to the /etc/hosts of your local machine, it will make your testing task easier.

modsecurity logs all its events to /var/log/httpd/modsecurity_audit.log. An easy way to test it is by using the tool https://cirt.net/Nikto2, which scans a website for different patterns of attack.
For example you could use:
````
perl nikto.pl site1.charlymps.com
````

## Issues

Currently sending modsecurity logs from nginx to waffle is not working.
I have found it's because when modsecurity writes the audit files, it misses the response status of the request, so when mlogc tries to parse it there's an error.



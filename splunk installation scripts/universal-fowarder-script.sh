#!/bin/bash
sudo -i
hostnamectl set-hostname capa-forwarder-3 && exec bash
cd /opt
yum -y install wget net-tools
adduser splunk 
wget -O splunkforwarder-8.2.4-87e2dda940d1-Linux-x86_64.tgz "https://download.splunk.com/products/universalforwarder/releases/8.2.4/linux/splunkforwarder-8.2.4-87e2dda940d1-Linux-x86_64.tgz"
tar -xvzf splunkforwarder-8.2.4-87e2dda940d1-Linux-x86_64.tgz -C /opt
chown -R splunk:splunk /opt/splunkforwarder
su - splunk
cd /opt/splunkforwarder/bin/
/opt/splunkforwarder/bin/splunk start --accept-license --answer-yes --no-prompt --seed-passwd welcome90
exit     #this is needed so you can leave splunk and run the next command as root#
/opt/splunkforwarder/bin/splunk enable boot-start -user splunk  #use -user and not --user#
su - splunk		#become splunk#
ls -laR /opt/splunkforwarder/var
/opt/splunkforwarder/bin/splunk status
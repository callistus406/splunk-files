sudo -i
hostnamectl set-hostname indexer-2 && exec bash
cd /opt
yum -y install wget net-tools
useradd splunk 
wget -O splunk-8.2.4-87e2dda940d1-Linux-x86_64.tgz 'https://download.splunk.com/products/splunk/releases/8.2.4/linux/splunk-8.2.4-87e2dda940d1-Linux-x86_64.tgz'
tar -xvzf splunk-8.2.4-87e2dda940d1-Linux-x86_64.tgz -C /opt
chown -R splunk:splunk /opt/splunk
su - splunk
cd /opt/splunk/bin/
/opt/splunk/bin/splunk start --accept-license --answer-yes --no-prompt --seed-passwd welcome90
exit     #this is needed so you can leave splunk and run the next command as root#
/opt/splunk/bin/splunk enable boot-start -user splunk  #use -user and not --user#
su - splunk		#become splunk#
ls -laR /opt/splunk/var
/opt/splunk/bin/splunk status



# 

#Forwarding Splunk's internal logs to the indexers

#In the /opt/splunk/etc/system/local directory, create an outputs.conf 

[indexAndForward]
index = false
[tcpout]
defaultGroup = dev_test_indexers
forwardedindex.filter.disable = true
indexAndForward = false
#enter your indexers server IPs here
[tcpout:dev_test_indexers]
server=172.31.28.223:9997,172.31.39.185:9997,172.31.13.169:9997
#!/bin/bash

#export ELASTICSEARCH_PORT_9200_TCP_ADDR=${ELASTICSEARCH_PORT_9200_TCP_ADDR}
#3sed -i "s/localhost/elasticsearch.default.svc.cluster.local/g" /etc/logstash/conf.d/java.conf

/opt/logstash/bin/logstash agent --config /etc/logstash/conf.d/java.conf 

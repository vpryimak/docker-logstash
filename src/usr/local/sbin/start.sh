#!/bin/bash

export ELASTICSEARCH_PORT_9200_TCP_ADDR=${ELASTICSEARCH_PORT_9200_TCP_ADDR}

sed -i "s/localhost/\"${ELASTICSEARCH_PORT_9200_TCP_ADDR}\"/g" /etc/logstash/conf.d/java.conf

/opt/logstash/bin/logstash agent --config /etc/logstash/conf.d/java.conf

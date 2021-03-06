FROM ubuntu:trusty
MAINTAINER Viacheslav Pryimak <vpryimak@intropro.com"

################## BEGIN INSTALLATION ######################
RUN apt-get update && \
  apt-get -y upgrade && \
  apt-get -y install wget libssl1.0.0 python openjdk-7-jre nload && \
  wget -q https://download.elastic.co/logstash/logstash/packages/debian/logstash_2.2.2-1_all.deb -O logstash.deb && \
  #wget -q https://download.elastic.co/logstash/logstash/packages/debian/logstash_1.4.2-1-2c0f5a1_all.deb -O logstash.deb && \
  dpkg -i logstash.deb && \
  rm logstash.deb 

RUN mkdir -p /etc/logstash/ssl
ADD ./conf.d /etc/logstash/conf.d
ADD ./ssl    /etc/logstash/ssl
ADD ./src    /
RUN chmod +x /usr/local/sbin/start.sh
RUN touch /var/log/logstash/logstash.log
RUN chmod 777 /var/log/logstash/logstash.log
##################### INSTALLATION END #####################

ENTRYPOINT ["/usr/local/sbin/start.sh"]

EXPOSE 22 5000
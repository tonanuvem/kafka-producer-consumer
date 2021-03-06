FROM openjdk:8-jdk-alpine

ENV ZOOKEEPER_VERSION 3.6.1

RUN apk update && apk upgrade && apk add bash gnupg

#Download Zookeeper
RUN wget -q http://mirror.vorboss.net/apache/zookeeper/zookeeper-${ZOOKEEPER_VERSION}/apache-zookeeper-${ZOOKEEPER_VERSION}-bin.tar.gz && \
wget -q https://www.apache.org/dist/zookeeper/KEYS && \
wget -q https://www.apache.org/dist/zookeeper/zookeeper-${ZOOKEEPER_VERSION}/apache-zookeeper-${ZOOKEEPER_VERSION}-bin.tar.gz.asc &&\
wget -q https://www.apache.org/dist/zookeeper/zookeeper-${ZOOKEEPER_VERSION}/apache-zookeeper-${ZOOKEEPER_VERSION}-bin.tar.gz.sha512

#Verify download
#RUN sha512sum -c apache-zookeeper-${ZOOKEEPER_VERSION}-bin.tar.gz.sha512 && \
#gpg --import KEYS && \
#gpg --verify apache-zookeeper-${ZOOKEEPER_VERSION}-bin.tar.gz.asc

#Install
RUN tar -xzf apache-zookeeper-${ZOOKEEPER_VERSION}-bin.tar.gz -C /opt && \
mv /opt/apache-zookeeper-${ZOOKEEPER_VERSION}-bin /opt/apache-zookeeper-${ZOOKEEPER_VERSION}

#Configure
RUN mv /opt/apache-zookeeper-${ZOOKEEPER_VERSION}/conf/zoo_sample.cfg /opt/apache-zookeeper-${ZOOKEEPER_VERSION}/conf/zoo.cfg

ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64
ENV ZK_HOME /opt/apache-zookeeper-${ZOOKEEPER_VERSION}
RUN sed  -i "s|/tmp/zookeeper|$ZK_HOME/data|g" $ZK_HOME/conf/zoo.cfg; mkdir $ZK_HOME/data && \
sed -i -r 's|#(log4j.appender.ROLLINGFILE.MaxBackupIndex.*)|\1|g' $ZK_HOME/conf/log4j.properties && \
sed -i -r 's|#autopurge|autopurge|g' $ZK_HOME/conf/zoo.cfg

EXPOSE 2181 2888 3888

WORKDIR /opt/apache-zookeeper-${ZOOKEEPER_VERSION}
VOLUME ["/opt/apache-zookeeper-${ZOOKEEPER_VERSION}/conf", "/opt/apache-zookeeper-${ZOOKEEPER_VERSION}/data"]

CMD bash /opt/apache-zookeeper-${ZOOKEEPER_VERSION}/bin/zkServer.sh start-foreground

FROM veny/centos
MAINTAINER Vaclav Sykora <vaclav.sykora@gmail.com>

ENV JAVA_VERSION 8u102
ENV JAVA_BUILD_VERSION b14
ENV JAVA_CHECKSUM_SHA256 7cfbe0bc0391a4abe60b3e9eb2a541d2315b99b9cb3a24980e618a89229e04b7

RUN wget --no-cookies --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" "https://download.oracle.com/otn-pub/java/jdk/$JAVA_VERSION-$JAVA_BUILD_VERSION/jdk-$JAVA_VERSION-linux-x64.tar.gz" -O /tmp/jdk-8-linux-x64.tar.gz \
        && echo "$JAVA_CHECKSUM_SHA256 /tmp/jdk-8-linux-x64.tar.gz" | sha256sum -c - \
        && tar xfvz /tmp/jdk-8-linux-x64.tar.gz -C /opt/ \
        && rm -f /tmp/jdk-8-linux-x64.tar.gz \
        && ln -f -s /opt/jdk* /opt/java

ENV JAVA_HOME=/opt/java
ENV PATH $PATH:$JAVA_HOME/bin

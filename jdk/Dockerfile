FROM veny/centos
MAINTAINER Vaclav Sykora <vaclav.sykora@gmail.com>

ENV JAVA_VERSION 8u102
ENV JAVA_BUILD_VERSION b14
ENV JAVA_DOWNLOAD_URL https://download.oracle.com/otn-pub/java/jdk/$JAVA_VERSION-$JAVA_BUILD_VERSION/jdk-$JAVA_VERSION-linux-x64.tar.gz
ENV JAVA_CHECKSUM_SHA256 7cfbe0bc0391a4abe60b3e9eb2a541d2315b99b9cb3a24980e618a89229e04b7
ENV JAVA_HOME=/opt/jdk
ENV PATH $PATH:$JAVA_HOME/bin

RUN wget --no-cookies --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" "$JAVA_DOWNLOAD_URL" -O /tmp/jdk.tar.gz \
        && echo "$JAVA_CHECKSUM_SHA256 /tmp/jdk.tar.gz" | sha256sum -c - \
        && mkdir -p ${JAVA_HOME} \
        && tar xfvz /tmp/jdk.tar.gz --strip-components=1 --directory ${JAVA_HOME} \
        && rm -f /tmp/jdk.tar.gz

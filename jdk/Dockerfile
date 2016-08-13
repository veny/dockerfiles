FROM veny/centos
MAINTAINER Vaclav Sykora <vaclav.sykora@gmail.com>

ENV JAVA_VERSION 8u102
ENV JAVA_BUILD_VERSION b14
#ENV JAVA_CHECKSUM f77b7e7d74a250204b198c5f9f3eb0dd2aa0db3824aa8c9c4b46e28ff1e58d91

RUN wget --no-cookies --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" "https://download.oracle.com/otn-pub/java/jdk/$JAVA_VERSION-$JAVA_BUILD_VERSION/jdk-$JAVA_VERSION-linux-x64.tar.gz" -O /tmp/jdk-8-linux-x64.tar.gz \
        && tar xfvz /tmp/jdk-8-linux-x64.tar.gz -C /opt/ \
        && rm -f /tmp/jdk-8-linux-x64.tar.gz \
        && ln -f -s /opt/jdk* /opt/java

ENV JAVA_HOME=/opt/java
ENV PATH $PATH:$JAVA_HOME/bin

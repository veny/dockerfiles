FROM veny/jdk
MAINTAINER Vaclav Sykora <vaclav.sykora@gmail.com>

ENV TOMCAT_MAJOR 8
ENV TOMCAT_VERSION 8.5.5
ENV TOMCAT_DOWNLOAD_URL http://mirror.dkm.cz/apache/tomcat/tomcat-$TOMCAT_MAJOR/v$TOMCAT_VERSION/bin/apache-tomcat-$TOMCAT_VERSION.tar.gz
ENV TOMCAT_CHECKSUM_SHA1 c711901edaa4497dc45f03747896b771a0aea4fd
ENV CATALINA_HOME=/opt/tomcat
ENV PATH $PATH:$CATALINA_HOME/bin
ENV JAVA_OPTS ""

RUN wget --no-cookies --no-check-certificate "$TOMCAT_DOWNLOAD_URL" -O /tmp/tomcat.tar.gz \
        && echo "$TOMCAT_CHECKSUM_SHA1 /tmp/tomcat.tar.gz" | sha1sum -c - \
        && mkdir -p ${CATALINA_HOME} \
        && tar xfvz /tmp/tomcat.tar.gz --strip-components=1 --directory ${CATALINA_HOME} \
        && rm -rf $CATALINA_HOME/webapps/examples \
        && rm -rf $CATALINA_HOME/webapps/docs \
        && rm -f /tmp/tomcat.tar.gz

WORKDIR $CATALINA_HOME
EXPOSE 8080
CMD ["catalina.sh", "run"]

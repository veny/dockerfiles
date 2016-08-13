FROM veny/jdk
MAINTAINER Vaclav Sykora <vaclav.sykora@gmail.com>

ENV ORIENTDB_VERSION 2.2.7
ENV ORIENTDB_DOWNLOAD_URL http://www.orientechnologies.com/download.php?email=unknown@unknown.com&file=orientdb-community-${ORIENTDB_VERSION}.tar.gz&os=linux
ENV ORIENTDB_HOME /opt/orientdb

ADD ${ORIENTDB_DOWNLOAD_URL} /tmp/orientdb.tar.gz

RUN mkdir -p ${ORIENTDB_HOME}
#RUN wget $ORIENTDB_DOWNLOAD_URL -O /tmp/orientdb-community.tar.gz
#RUN echo "$ORIENTDB_CHECKSUM_SHA1 /tmp/orientdb-community.tar.gz" | sha1sum -c -
RUN tar xvzf /tmp/orientdb.tar.gz --strip-components=1 --directory ${ORIENTDB_HOME}
RUN rm -f /tmp/orientdb.tar.gz
RUN rm -rf ${ORIENTDB_HOME}/databases/*

ENV PATH $PATH:$ORIENTDB_HOME/bin

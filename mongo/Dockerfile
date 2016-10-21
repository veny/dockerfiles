FROM veny/centos
MAINTAINER Vaclav Sykora <vaclav.sykora@gmail.com>

ENV MONGODB_VERSION 3.2.10

COPY mongo.repo /etc/yum.repos.d/

RUN set -x \
        && yum -y install mongodb-org-$MONGODB_VERSION \
        && yum clean all \
        && sed -i "s/fork: true/fork: false/" /etc/mongod.conf \
        && sed -i "s/bindIp: /# bindIp: /" /etc/mongod.conf \
        && sed -i 's/  path: .*$/  path: \/dev\/stdout/' /etc/mongod.conf

EXPOSE 27017
VOLUME ["/var/lib/mongo", "/var/log/mongodb"]

USER mongod
CMD ["/usr/bin/mongod", "--config", "/etc/mongod.conf"]

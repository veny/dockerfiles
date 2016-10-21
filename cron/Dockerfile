FROM veny/centos
MAINTAINER Vaclav Sykora <vaclav.sykora@gmail.com>

RUN set -x \
        && yum -y install cronie \
        && yum clean all

CMD ["/bin/sh", "-c", "crond -n -x bit &>/var/log/cronie.log"]

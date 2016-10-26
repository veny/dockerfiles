FROM veny/centos
MAINTAINER Vaclav Sykora <vaclav.sykora@gmail.com>

ENV MONITORIX_VERSION 3.9.0-1
ENV MONITORIX_DOWNLOAD_SHA1 eb2486efe589757077c1a9d5c1a1de2a07e3995d

RUN set -x \
        # the 'rpm' package has dependencies in EPEL repository
        && yum -y install epel-release \
        && wget "http://www.monitorix.org/monitorix-${MONITORIX_VERSION}.noarch.rpm" \
        && echo "$MONITORIX_DOWNLOAD_SHA1 *monitorix-${MONITORIX_VERSION}.noarch.rpm" | sha1sum -c - \
        && yum localinstall -y monitorix-${MONITORIX_VERSION}.noarch.rpm \
        && rm monitorix-${MONITORIX_VERSION}.noarch.rpm \
        && yum clean all

# RUN set -x \
#         && yum -y install epel-release \
#         && yum -y install install monitorix \
#         && yum clean all

EXPOSE 8080

CMD ["/usr/bin/monitorix", "-n", "-c", "/etc/monitorix/monitorix.conf"]

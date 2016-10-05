FROM veny/centos
MAINTAINER Vaclav Sykora <vaclav.sykora@gmail.com>

RUN set -x \
        && yum -y --setopt=tsflags=nodocs install httpd mod_ssl \
        && yum clean all \
        && find /etc/httpd/conf.d/ -type f -name *.conf -exec mv {} {}.orig \; \
        && cp /etc/httpd/conf/httpd.conf /etc/httpd/conf/httpd.conf.orig \
        && sed -i 's/^#ServerName.*/ServerName localhost:80/' /etc/httpd/conf/httpd.conf

EXPOSE 80 443
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

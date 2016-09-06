FROM veny/centos
MAINTAINER Vaclav Sykora <vaclav.sykora@gmail.com>

# For better understanding of syslog logging, see here:
# http://unix.stackexchange.com/questions/205883/understand-logging-in-linux

RUN set -x \
        && yum -y install rsyslog postfix \
        && yum clean all
RUN /usr/bin/newaliases \
        && postconf -e myhostname="smevente.com" inet_interfaces="all" \
        && mv /etc/rsyslog.conf /etc/rsyslog.conf.orig
COPY rsyslog.conf /etc/rsyslog.conf

EXPOSE 25

CMD ["sh", "-c", "/usr/sbin/postfix start ; rm -f /var/run/rsyslogd.pid ; /usr/sbin/rsyslogd -n"]
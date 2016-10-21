FROM veny/centos
MAINTAINER Vaclav Sykora <vaclav.sykora@gmail.com>

# For better understanding of syslog logging, see here:
# http://unix.stackexchange.com/questions/205883/understand-logging-in-linux

# Postfix SASL Howto
# http://www.postfix.org/SASL_README.html

RUN set -x \
        && yum -y install rsyslog postfix cyrus-saslcyrus-sasl cyrus-sasl-plain cyrus-sasl-md5 \
        && yum clean all \
        && /usr/bin/newaliases \
        && postconf -e myhostname="mail.example.com" \
        && postconf -e inet_interfaces="all" \
        && mv /etc/rsyslog.conf /etc/rsyslog.conf.orig
COPY rsyslog.conf /etc/rsyslog.conf
COPY smtpd.conf /etc/sasl2/smtpd.conf

COPY run.sh /
RUN chmod +x /run.sh

EXPOSE 25
VOLUME "/var/log"
WORKDIR /

CMD ["/run.sh"]

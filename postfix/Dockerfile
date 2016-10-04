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
VOLUME "/var/log"

COPY run.sh /
RUN chmod +x /run.sh
WORKDIR /
CMD ["/run.sh"]

# postconf -e "smtpd_recipient_restrictions = permit_mynetworks, permit_sasl_authenticated, reject_unauth_destination"
# mynetworks = localhost 127.0.0.1 85.13.109.195 belem 172.17.0.1
# SMPT Auth:
#  https://help.ubuntu.com/community/Postfix
# https://github.com/muzili/docker-centos-postfix
# https://github.com/eea/eea.docker.postfix

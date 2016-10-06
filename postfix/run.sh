#!/usr/bin/env bash

# exit immediately if a command exits with a non-zero status
set -e

# redefine some config if overriden by env variables

# specifies the internet hostname of this mail system
[ ! -z "$SMTP_HOST" ] && postconf -e myhostname="$SMTP_HOST"
# specifies the network interface addresses that this mail system receives mail on
[ ! -z "$SMTP_INTERFACES" ] && postconf -e inet_interfaces="$SMTP_INTERFACES"
# specifies list of "trusted" remote SMTP clients that are allowed to relay mail through Postfix
[ ! -z "$SMTP_MYNETWORKS" ] && postconf -e mynetworks="$SMTP_MYNETWORKS"


if [ "$SMTP_SASL_AUTH_ENABLE" == "true" ]; then
    echo "SASL enabled, initialization..."

    if [ -z "$SMTP_SASL_USER" ]; then # the user cannot be blank
        echo >&2 'error: SMTP_SASL_USER not set'
        echo >&2 'Did you forget to add -e SMTP_SASL_USER=... ?'
        exit 1
    fi
    if [ -z "$SMTP_SASL_PASSWORD" ]; then # the password cannot be blank
        echo >&2 'error: SMTP_SASL_PASSWORD not set'
        echo >&2 'Did you forget to add -e SMTP_SASL_PASSWORD=... ?'
        exit 1
    fi

    postconf -e smtpd_sasl_auth_enable="yes"
    postconf -e smtpd_sasl_security_options="noanonymous"
    postconf -e smtpd_sasl_local_domain=""
    postconf -e broken_sasl_auth_clients="yes"
    postconf -e smtpd_recipient_restrictions="permit_sasl_authenticated,permit_mynetworks,reject_unauth_destination"
    echo "$SMTP_SASL_PASSWORD" | saslpasswd2 -c -u `postconf -h myhostname` $SMTP_SASL_USER -p
    chown postfix /etc/sasldb2
    chmod 660 /etc/sasldb2
    sasldblistusers2
    echo "SASL [OK]"
fi


trap_term_signal() {
    echo "Caught SIGTERM signal, shutting down ..."
    /usr/sbin/postfix stop
    killall rsyslogd
}
trap "trap_term_signal" SIGINT SIGTERM


/usr/sbin/postfix start
rm -f /var/run/rsyslogd.pid
/usr/sbin/rsyslogd -n &
wait

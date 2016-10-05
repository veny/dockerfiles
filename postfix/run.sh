#!/usr/bin/env bash

# exit immediately if a command exits with a non-zero status
set -e

# redefine some config if overriden by env variables
[ ! -z "$MYHOSTNAME" ] && postconf -e myhostname="$MYHOSTNAME"

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

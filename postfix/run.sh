#!/usr/bin/env bash

# exit immediately if a command exits with a non-zero status
set -e

trap_term_signal() {
    echo 'stopping ...'
    /usr/sbin/postfix stop
    killall rsyslogd
    exit 0
}
trap "trap_term_signal" SIGINT
trap "trap_term_signal" SIGTERM
trap "trap_term_signal" SIGKILL

/usr/sbin/postfix start
echo "postfix started..."

rm -f /var/run/rsyslogd.pid
/usr/sbin/rsyslogd
echo "rsyslog started..."

# wait forever
while true
do
  tail -f /dev/null & wait ${!}
done

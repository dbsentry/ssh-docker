#!/bin/sh

USER="$1"
HOST=`hostname`
KEYPER_HOST=sprout.dbsentry.com

curl -s -q -f -m 7  "http://${KEYPER_HOST}/api/authkeys?username=${USER}&host=${HOST}"
#curl -s -q -f -m 7 -Fusername=${USER} -Fhost=${HOST} http://${KEYPER_HOST}/api/authkeys

exit $?

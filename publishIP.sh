#!/bin/bash

if [ $# -eq 0 ]
  then
    echo "$0 relay-email admin-email"
    exit 1
fi

HOSTNAME="$(hostname)"
WLAN="$(iwgetid)"
IP="$(ip route list)"

printf 'To: $1\nFrom: $2\nSubject: Hostname information for %s\n\n%s\n%s\n\n' "$HOSTNAME" "$WLAN" "$IP" | ssmtp $2


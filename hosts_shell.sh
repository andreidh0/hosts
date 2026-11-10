#!/bin/bash

check_ip() {
    name="$1"
    ip="$2"
    dns="$3"
    real=`nslookup "$name" "$dns" 2>/dev/null | grep "^Address" | tail -n 1 | cut -d " " -f 2`
    [ "$real" = "$ip" ]
}

DNS="${1:-8.8.8.8}"

cat /etc/hosts | while read ip name rest; do
    case "$ip" in
        ""|\#*) continue ;;
    esac
    [ -z "$name" ] && continue

    if ! check_ip "$name" "$ip" "$DNS"; then
        echo "IP gresit pentru $name in /etc/hosts!"
    fi
doneecho "DabuBogdan"

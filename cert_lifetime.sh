#!/bin/bash
# Simple script to check validity of a given TLS cert
set -e

if [ -z "$1" ]; then
    echo "Usage: $0 <cert>.pem"
    exit 1
fi

function timestamp() {
    [ -z "$1" ] && date "+%s" || date -d "${1}" "+%s"
}

valid_until=$(openssl x509 -in "$1" -noout -enddate | cut -d '=' -f 2)

diff=$(( $(timestamp "${valid_until}") - $(timestamp) ))
echo "Valid for $(( diff / (60*60*24) )) days until ${valid_until}"

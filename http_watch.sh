#!/bin/sh
if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ]; then
    echo "Usage: $0 <website> <code> <delay>"
    exit 1
fi

while [ ! "${http_code}" == "$2" ]; do
    http_code=$(curl "$1" -I -w "%{http_code}" -s -o /dev/null)
    sleep $3
done


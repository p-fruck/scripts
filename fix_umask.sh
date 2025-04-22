#!/bin/sh

if [ -z "$1" ]; then
  echo "Usage: $0 <dir>"
  exit 1
fi

find "$1" -type d -exec chmod 755 {} \;
find "$1" -type f -exec chmod 644 {} \;

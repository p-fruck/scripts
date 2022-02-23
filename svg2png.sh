#!/bin/sh

input="$1"
sizes=$2

for size in $sizes; do
  inkscape -w $size -h $size $input -o icon-${size}x${size}.png
done

#!/bin/sh
timeout=60

function move_cursor() {
	xdotool mousemove $1 $1
	echo "$1,$1 - `date`"
	sleep ${timeout}
}

while true; do
	move_cursor 100
	move_cursor 200
done

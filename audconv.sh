#!/bin/sh

for song in $1/*; do
	name=`basename "$song"`
	ffmpeg -i "$song" "$2/${name%%.*}.mp3"
done

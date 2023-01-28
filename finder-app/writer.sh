#!/bin/bash

if [ "$1" = "" ] || [ "$2" = "" ]; then
	echo "Command must be run as 'writer.sh [directory/filename] [text]'."
	exit 1
fi

writefile="$1"
writestr="$2"

mkdir -p $(dirname $writefile)
echo "$writestr" > $writefile

if [ $(cat $writefile) != "$writestr" ]; then
	echo "Failed to write $writestr to $writefile"
	exit 1
fi

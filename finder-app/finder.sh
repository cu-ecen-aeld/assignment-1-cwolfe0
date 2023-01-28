#!/bin/bash

if [ "$1" = "" ] || [ "$2" = "" ]; then
	echo "Command must be run as 'finder.sh [directory] [search string]'."
	exit 1
fi

if [ -e $1 ]; then
	filesdir=$1
	searchstr=$2
else
	echo "No such directory '$1'."
	exit 1
fi
numFiles=0
numLines=0

numFiles=$(grep -Rxlc $searchstr $filesdir/* | wc -l)
numLines=$(grep -Rxc $searchstr $filesdir/* | awk -F ':' '{numLines += $2}; END{print numLines}')


echo "The number of files are $numFiles and the number of matching lines are $numLines"

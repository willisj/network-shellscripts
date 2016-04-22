#!/bin/bash

if [ "2" -eq "$#" ] && [ -f "$1" ] && [ -f "$2" ]; then
	for mac in $( ./list_macs_with_handshakes.sh $2 | cut -f2 -d'	' ) ; do
		echo "Attempting to crack $mac in $2"
		aircrack-ng $2 -b "$mac" -w $1 -l "$mac" > /dev/null
	done
else
	echo "Usage: [password list] [mac]"
	exit 1
fi;


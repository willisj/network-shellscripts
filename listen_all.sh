#!/bin/bash

# Arg1 = WifiDevice
num_args=2	# number of arguments

if [ ! $num_args -eq $#  ]; then 
	echo "Error: invalid usage."
	echo "    ./attack_wep.sh <adapter> <output_file>"
	exit 1
fi

ifconfig_result=$( ifconfig $1 )
if [ ! $? -eq 0 ];then
	echo "Adapter does not exist. Do you have root?"
	exit 1
fi

airodump_result=$(airodump-ng -i $1 --ivs -w $2)
if [ ! $? -eq 0 ];then
	echo "Unable to start airodump."
	echo $airodump_result
	exit 1
fi





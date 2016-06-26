#!/bin/bash


# Arg1 = Wifi Interace
num_args=1	# number of arguments

if [ ! $num_args -eq $#  ]; then 
	echo "Error: please specify a wlan adapter"
	exit 1
fi

ifconfig_result=$( ifconfig $1 )
if [ ! $? -eq 0 ];then
	echo "Adapter does not exist. Do you have root?"
	exit 1
fi

airmon_result=$(airmon-ng start $1)
if [ ! $? -eq 0 ];then
	echo "Unable to put the adapter into monitor mode."
	exit 1
fi

mon_adapter=$(echo $airmon_result | grep -E "mon[0-9]+" -o | tail -n 1)
echo $mon_adapter
airodump-ng  -i "$mon_adapter"




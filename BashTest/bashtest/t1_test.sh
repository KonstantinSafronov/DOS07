#!/bin/bash

function IpCheck {
IpRegexp='([0-9]{1,3}[\.]){3}[0-9]{1,3}'
if echo $1 | grep -E $IpRegexp>/dev/null
then
	ping -c 5 $1>/dev/null
	if echo $?2>/dev/null -eq 0
	then
	echo "ping is OK"
	else 
	echo "remote server unreachable"
	exit
	fi
else
echo "entered wrong ip-address"
exit
fi
}

function FileCheck {

#if [ ! -f /home/cos/bashtest/$1 ] || [ -z $1 ]
if [ ! -f $1 ]
then
echo "file doesn't exist"
exit
else
chek=1
fi
}


echo -n "Enter remote server IP-address:"
read IpAdd

IpCheck $IpAdd

chek=0
echo -n "Enter FileName whith full pass:"
read FileName

FileCheck $FileName

if [ $chek -ne 0 ]
then
scp $FileName uuser@$IpAdd:/tmp/$FileName2>/dev/null
	if echo $?2>/dev/null -eq 0
        then
        echo "Copy is OK"
        else 
        echo "Copy falls"
        exit
        fi
fi

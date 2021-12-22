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

function SpaceCheck {

HddUsage=( $(ssh uuser@$1 'df -h /'| awk '{print $(NF-1)}' | grep % | cut -d "%" -f 1) )

if [ $HddUsage -gt 70 ] && [ $HddUsage -lt 80 ]
then

curl --url 'smtps://smtp.gmail.com:465' --ssl-reqd --mail-from 'sender@gmail.com' --mail-rcpt 'resiever@ya.ru' \
 --upload-file /home/cos/hw18/mail70.txt --user 'sender@gmail.com:SenderMailPassword'

elif [ $HddUsage -gt 80 ] && [ $HddUsage -lt 90 ]
then 

echo "Subject: WARNING - over 80% hdd usage!!!" >> /home/cos/hw18/mail80.txt
echo "List of 10 largest files at $1:" >> /home/cos/hw18/mail80.txt
echo >> /home/cos/hw18/mail80.txt
ssh uuser@$1 'find / -type f -exec du -sh {} 2>/dev/null \;' | sort -rh | head >> /home/cos/hw18/mail80.txt

curl --url 'smtps://smtp.gmail.com:465' --ssl-reqd --mail-from 'sender@gmail.com' --mail-rcpt 'resiever@ya.ru' \
 --upload-file /home/cos/hw18/mail80.txt --user 'sender@gmail.com:SenderMailPassword'

rm /home/cos/hw18/mail80.txt

elif [ $HddUsage -gt 90 ]
then
ssh -t uuser@$1 "find /var/log -type f -exec du -sh {} 2>/dev/null \; | sort -hr | head -n 5 | cut -d '	' -f 2- | xargs -L1 sudo rm -f"

fi
}


echo -n "enter remote server ip-address:"
read ServerIp

IpCheck $ServerIp

SpaceCheck $ServerIp

#!/bin/bash

function NameCheck {
UserList=$(sudo cat /etc/passwd | cut -d: -f1)

for item in $UserList
do
	if [ "$1" = $item ] || [ -z "$1" ]
	then
		check=0
		break
	else
		check=1
		continue
	fi
done
return $check

}

num=1
while [ $num -gt 0 ]
do

echo -n "Enter UserName: "
read UserName
NameCheck $UserName

if [ $check -eq 1  ]
then
break
else

echo "Enter UserName again (last $((5-$num)) times)"
num=$(($num+1))
fi
if [ $num -eq 6 ]
then
exit
fi
done

echo -n "Enter UserPassword: "
read UserPassword

echo -n "Enter HomeDir with full pass: "
read HomeDir

echo [
cat /etc/shells
echo ]
echo -n "Enter UserShell from list: "
read UserShell

sudo useradd -p "$UserPassword" -s $UserShell -m -d $HomeDir $UserName 2>/dev/null

cat /etc/passwd|grep $UserName

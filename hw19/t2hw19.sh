#!/bin/bash

for Fitem in $(ls /home/uuser/hw19/t2hw19 | awk '/_autorun$/{print $0}')
do
#echo "$Fitem"
if [ -f "/home/uuser/hw19/t2hw19/$Fitem" ]
then
#       echo "$Fitem"
        /home/uuser/hw19/t2hw19/$Fitem
else
continue
fi
done

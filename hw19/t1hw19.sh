#!/bin/bash


CountNumber=0

while [ $CountNumber -eq 0 ]
do

echo "Enter 'Y' or 'y' to continue; else 'N' or 'n' to stop the script"
read EntrySymbol

        if [ -z $EntrySymbol ]
        then
        echo "enter smthing"
        continue

        elif [ $EntrySymbol = Y ] || [ $EntrySymbol = y ]
        then
        echo "you choose to contiinue"
        continue

        elif [ $EntrySymbol = N ] || [ $EntrySymbol = n ]
        then
        break

        elif [ -n $EntrySymbol ]
        then
        echo "try again"
        fi
done

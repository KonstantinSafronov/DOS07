#!/bin/bash
function filefind {
list=$(ls $1)
for item in $list
do
        if [ -d "$1/$item" ]
        then
                cd "$1/$item"
                filefind "$1/$item"
                continue
        else
        echo "$1/$item"
        fi
done
}


echo -n "Enter DirName with full pass: "
read DirPass
echo "Finded files -------------------------------------------------------------"
filefind $DirPass
cd $DirPass

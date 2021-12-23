#!/bin/bash

function hw18task1 {
let "res=($1*$2)%2"

if [ $(($1*$2)) -eq 0 ]
then
        answer="Null was entered, try again"
elif [ $res -eq 0 ]
then
        answer=1
else
        answer=0
fi
}

echo -n "Enter a value#1: " 
read value1
echo -n "Enter a value#2: "
read value2



hw18task1 $value1 $value2
echo "Function result is - $answer"

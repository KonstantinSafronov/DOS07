#!/bin/bash

function func {
for item in $@
do
echo "$item"
done
}
read -p "Enter array of values (spaces as delims): " array
func ${array[*]}

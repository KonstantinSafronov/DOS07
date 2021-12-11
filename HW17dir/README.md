# HW17

>## _Task 1_

- Pass the test: https://proghub.ru/t/bash-for-beginner

[![hw17t1](https://github.com/KonstantinSafronov/DOS07/blob/HW17/HW17dir/hw17pic1.png)](https://github.com/KonstantinSafronov/DOS07/blob/HW17/HW17dir/hw17pic1.png)

>## _Task 2_

- Создать скрипт, который проходит по всем аргументам которым мы передаем в скрипт и выводит их ( каждый в новой строке).


```sh

#!/bin/bash
if [ -n "$1" ]
then
	count=1
	for param in "$@"
	do
		echo "Parameter #$count = $param"
		count=$(( $count + 1 ))
	done
else
	echo “No parameters to work with, Enter parameters”
fi

```

>## _Task 3_

- Develop a script which will recursively print all files in the directory provided as a parameter provided via READ.
If this path contains folders - script should recursively do the same in this folder.


```sh

#!/bin/bash
echo -n "Enter FullPass to directory to find IN: "
read DirPass
echo
echo "List of directories - "
if [ -n "$DirPass" ]
then
	find $DirPass -type d -exec echo {} \;
else
	echo “No Pass to directory was entered, try again”
fi

```


>## _Task 4_

- *Написать скрипт, который будет считать the sum and average чисел в 3 колонках
The input:
4  10  21
6  20  31
Should print:
sum 10  30  52
ave   5    15  26  


```sh

#!/bin/bash
awk -f awkfile numfile

```

>Content of the file "awkfile":
```sh

BEGIN {
x=0
y=0
z=0
count=0
}
{
x += $1
y += $2
z += $3
count += 1
}
END {
average_x=x/count
average_y=y/count
average_z=z/count
print x, y, z
print average_x, average_y, average_z
}

```

>Example of content of the file "numfile":
```sh
4 10 21
6 20 31
13 4 54
```

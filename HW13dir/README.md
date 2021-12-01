# HW13

>## _- PART 1 -_

## _Task 1-2_

- 1) configure X11 on ssh
- 2) connect to vm using graphical interface via ssh

[![hw13t1](https://github.com/KonstantinSafronov/DOS07/blob/HW13/HW13dir/hw13t01.png)](https://github.com/KonstantinSafronov/DOS07/blob/HW13/HW13dir/hw13t01.png)

[![hw13t2](https://github.com/KonstantinSafronov/DOS07/blob/HW13/HW13dir/hw13t02.png)](https://github.com/KonstantinSafronov/DOS07/blob/HW13/HW13dir/hw13t02.png)

## _Task 3_

- Вывести номер строки, где указан наш пользователь в etc/passwd

```sh

grep -n $USER /etc/passwd|cut -d : -f 1

```

## _Task 4_

- Вывести домашнюю директорию для нашего пользователя, оперируя файлом etc/passwd

```sh

ut -d : -f 6 /etc/passwd| grep -w $USER

```


## _Task 5_

- Посчитать кол-во строк в файле /etc/passwd

```sh

cat /etc/passwd | wc -l

```


# _Task 6_

- Сохранить список всех файлов в usr/bin/, которые написаны на Bash,Shell, Python
и имеют кодировку UTF в файл bin.txt и отсортируйте по размеру - Выполнение 1 строка


```sh

find /usr/bin -type f | xargs grep -Eil '(^#!)+.*sh$|(^#!)+.*shell$|(^#!)+.*bash$|(^#!)+.*python$|(^#!)+.*python3$' | xargs file -i|grep utf | cut -d : -f 1 |xargs ls -lSr | cut -d / -f 2-4 > task6.txt

```

# _Task 7_

- 1) В домашнем каталоге пользователя создайте несколько файлов с расширением html.
- 2) Перейдите в каталог /
- 3) Найдите созданные файлы в домашнем каталоге из каталога /, не спускаясь в домашний каталог


```sh

sudo find / -maxdepth 4 -name "*.html"

```

# _Task 8_

- Скопировать все файлы, которые имеют расширение  *.html в файлы с соответствующим началом *.new.html
(например был файл file1.html, а нужно чтобы стал file1.new.html):


```sh

find ~/Task8HW13/ -name "*.html" -type f | cut -d . -f 1 |cut -d / -f 5 | xargs -i cp /home/uuser/Task8HW13/{}.html /home/uuser/Task8HW13/t8dir/{}.new.html

```

# _Task 9_

- Вывести количество каталогов в дереве `/usr/share'

```sh

find /usr/share -type d | wc -l 

```

# _Task 10_

- Закинуть на удаленный сервис директорию/файл архивом. Создание архива должно быть отражено в команде и архив не должен быть создан локально. 1 строка


```sh

tar zcvf - /home/cos/test.doc | ssh uuser@192.168.0.11 "cat > /home/uuser/HW13t12/hw13t12.tar.gz"

```

# _Task 11_

- У нас есть репозиторий с множеством файлов в разных каталогах с расширением sh.
Нужно скачать репозиторий, найти эти файлы и поменять разрешение на исполняемый файл.
Сделать двумя способами в одну строку.


```sh

cp -r /home/uuser/HW13task13/* /home/uuser/HW13task13_2 ; find /home/uuser/HW13task13_2 -name "*.sh" -exec chmod +x {} \;

cp -r /home/uuser/HW13task13/* /home/uuser/HW13task13_2 ; find /home/uuser/HW13task13_1 -name "*.sh"| xargs chmod +x

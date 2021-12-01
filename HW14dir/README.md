# HW14

>## _- PART 1 -_

## _Task 1_

- Записать в файл информацию о типе ОС
```sh

cat /etc/*-release | grep -i "DISTRIB_DESCRIPTION" | cut -d = -f 2

```

## _Task 2_

- Записать в файл Имя ОС

```sh

cat /etc/*-release | grep -i "^NAME" | cut -d = -f 2

```

## _Task 3_

- Записать версию ядра

```sh

uname -a | cut -d " " -f 3

```


## _Task 4_

- Записать ip адрес

```sh

ip a| grep 192 | cut -d " " -f 6

```


# _Task 5_

- Записать имя сервера

```sh

hostname

```

# _Task 6_

- Сохранить информацию о процессоре в файле

```sh

cat /proc/cpuinfo | grep -i "model name" | cut -d " " -f 3-

```

# _Task 7_

- Записать LA (Load Average) за последние 15 минут в файл.

```sh

uptime | cut -d " " -f 13

```

# _Task 8_

- Записать время работы системы в файл.

```sh

uptime -p

```

# _Task 9_

- Вывести информацию об использованной RAM и записать в файл.

```sh

free -h --mega| grep -i "mem" | cut -d " " -f 1,20

```

# _Task 10_

- Сохранить информацию о потребляемом Swap в файл

```sh

free -h --mega| grep -i "swap" | cut -d " " -f 1,19

```


# _Task 11_

- Записать текущие размеры дисков в файл.

```sh

sudo fdisk -l | grep -Ei "^/dev" | cut -b 1-10,40-41

```

# _Task 12_

- Записать в файл информацию об авторизованных пользователях в системе в данный момент.

```sh

who

```

# _Task 13_

- Объединить все файлы в один

```sh

cat hw14task[0-1][0-9].txt

```
[![hw14p1t1](https://github.com/KonstantinSafronov/DOS07/blob/HW14/HW14dir/hw14p1.png)](https://github.com/KonstantinSafronov/DOS07/blob/HW14/HW14dir/hw14p1.png)



>## _- PART 2 -_

## _Task 1_

- Получить список всех UNIX Socket портов на машине, которые прослушиваются и вывести в файл только названия сокетов

```sh

ss -lntu | awk '{print $5}'

```

[![hw14p2t01](https://github.com/KonstantinSafronov/DOS07/blob/HW14/HW14dir/hw14p2t01.png)](https://github.com/KonstantinSafronov/DOS07/blob/HW14/HW14dir/hw14p2t01.png)

## _Task 2_

- Получить список всех udp портов на машине и записать в файл (2 способа)

```sh

ss -lntu | grep -i udp | awk '{print $5}'
sudo netstat -tulpn | grep -i udp | awk '{print $4}'

```

[![hw14p2t02](https://github.com/KonstantinSafronov/DOS07/blob/HW14/HW14dir/hw14p2t02.png)](https://github.com/KonstantinSafronov/DOS07/blob/HW14/HW14dir/hw14p2t02.png)

## _Task 3_

- Вывести в файл таблицу маршрутизации на машине

```sh

routel

```

[![hw14p2t03](https://github.com/KonstantinSafronov/DOS07/blob/HW14/HW14dir/hw14p2t03.png)](https://github.com/KonstantinSafronov/DOS07/blob/HW14/HW14dir/hw14p2t03.png)

## _Task 4_

- Получить список всех открытых портов на машине (записать в файл, 2 способа)

```sh

ss -lntu | grep -i listen | awk '{print $5}'

```

[![hw14p2t04](https://github.com/KonstantinSafronov/DOS07/blob/HW14/HW14dir/hw14p2t04.png)](https://github.com/KonstantinSafronov/DOS07/blob/HW14/HW14dir/hw14p2t04.png)

## _Task 5_

- Вывести статистику для каждого протокола на машине

```sh

netstat -s

```

## _Task 6_

- Установить переменную окружения, так чтобы при логине и удаленном соединении эта переменная оставалась в системе для текущего пользователя

[![hw14p2t06_1](https://github.com/KonstantinSafronov/DOS07/blob/HW14/HW14dir/hw14p2t06_1.png)](https://github.com/KonstantinSafronov/DOS07/blob/HW14/HW14dir/hw14p2t06_1.png)

[![hw14p2t06_2](https://github.com/KonstantinSafronov/DOS07/blob/HW14/HW14dir/hw14p2t06_2.png)](https://github.com/KonstantinSafronov/DOS07/blob/HW14/HW14dir/hw14p2t06_2.png)

## _Task 7_

- Вывести в файл список всех unix socket, у которых статус Connected в виде
I-Node - Path списком и записать в файл

```sh

netstat | grep -i connected | awk '{print $7, "-", $8}'

```

[![hw14p2t07](https://github.com/KonstantinSafronov/DOS07/blob/HW14/HW14dir/hw14p2t07.png)](https://github.com/KonstantinSafronov/DOS07/blob/HW14/HW14dir/hw14p2t07.png)

# Test Utils

## _Task 1_

- Скачать git репу https://github.com/hashicorp/vagrant, используя curl
```sh

curl -LO https://github.com/hashicorp/vagrant/archive/main.tar.gz 

```

## _Task 2_

- Сгенерировать 4к ssh ключи и залить на удаленный сервер

```sh

ssh keygen -b 4096 ; ssh-copy-id username@remote_host

```

## _Task 3_

- Download file if it was changed after 31-Jan-18
 http://ftp.byfly.by/pub/CentOS/7/updates/x86_64/repodata/repomd.xml

```sh

curl -z 31-Jan-18 -O http://ftp.byfly.by/pub/CentOS/7/updates/x86_64/repodata/repomd.xml

```


## _Task 4_

- Download file with limited speed 50K
http://ftp.byfly.by/pub/CentOS/7/updates/x86_64/repodata/repomd.xml

```sh

curl --limit-rate 50K -O http://ftp.byfly.by/pub/CentOS/7/updates/x86_64/repodata/repomd.xml

```


# _Task 5_

- Создать файл в директории /opt и не спускаясь из текущей директории найти данный файл и удалить в одну команду

```sh

sudo touch /etc/opt/test_task5.txt ; sudo find . -maxdepth 3 -name "test_task5.txt" -exec rm {} \;

```

# _Task 6_

- Найти в директории, например /tmp или /var пустые файлы

```sh

find /tmp -type f -empty

```

# _Task 8_

- Изменить цвет и размер шрифта по умолчанию в консоли вашего пользователя.

```sh

Edit variable  “PS1” in  “/etc/bashrc”

```

# _Task 9_

- Вывести информацию о созданном файле в отдельный файл txt.

```sh

stat filename > file.info

```

# _Task 11_

- Пронумеровать строчки системного лога.

```sh

cat -n file

```

# _Task 12_

- Посмотреть первые 10 событий любого журнала.

```sh

head filename

```


# _Task 13_

- Найти в домашней папке все файлы, начинающиеся с букв "a" по "z" и скопировать их в папку temp в домашнем "каталоге".

```sh

find ~/ -type f -name “^[a-z]” -exec cp ~/{} ~/temp/ \;

```

# _Task 14_

- Запустить диспетчер задач top в фоновом режиме.

```sh

top &

```

# _Task 15_

- Найти в журналах событий /var/log логи, содержащие ваш логин.
- 
```sh

grep -iRl "$USER" /var/log

```

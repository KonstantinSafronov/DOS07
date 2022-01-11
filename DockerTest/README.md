# DockerTest

>##    1. Какие состояния есть у докер контейнера?
>  One of created, restarting, running, removing, paused, exited, or dead
       
>##    2. Какие три компонента Докер архитектуры
> 	Client, Host, Registry
>##    3. Можно ли потерять данные при выходе из контейнера, стоп его или удаления. Опишите варианты.

> Данные в слое чтения\записи контейнера:
> При выходе из контейнера данные потерять нельзя.
> При остановке контейнера 
> При удалении контейнера данные теряются.
> Данные хранящиеся в выделенной оперативной памяти хранятся до перезагрузки хоста.
> Данные хранящиеся в монтируемом “внешнем” томе сохраняются всегда.

>##    4. Какие виды подключения диска доступны для докера?
> Volume, Bind mount
>##    5. Что такое dockerignore? Для чего он используется? Приведите примеры.
> Служебный файл со списком исключений файлов и папок, в виде имён или шаблонов, которые Docker должен игнорировать в ходе сборки образа.

>##    6. Для чего используется env и arg в  Dockerfile. Описать отличия.
> ARG — задаёт переменные для передачи Docker во время сборки образа.
	ENV — устанавливает постоянные переменные среды

>##    7. Можно ли использовать json вместо yaml для docker-compose в Докере? (Если да - как это реализовать, пример)

>##    8. Можно ли запустить одну и ту же копию docker-compose файла в Докере на одном хосте несколько раз? Как это сделать - если можно?
       
>##    9. Что такое  Docker object labels? Для чего нужны? Привести примеры.

> Labels are a mechanism for applying metadata to Docker objects, including:
    • Images 
    • Containers 
    • Local daemons 
    • Volumes 
    • Networks 
    • Swarm nodes 
    • Swarm services 
You can use labels to organize your images, record licensing information, annotate relationships between containers, volumes, and networks, or in any way that makes sense for your business or application.


>#### In Dockerfile:

```
LABEL "com.example.vendor"="ACME Incorporated"
LABEL com.example.label-with-value="foo"
LABEL version="1.0"
LABEL description="This text illustrates \
that label-values can span multiple lines."
```

> docker image inspect --format='' myimage

```{
  "com.example.vendor": "ACME Incorporated",
  "com.example.label-with-value": "foo",
  "version": "1.0",
  "description": "This text illustrates that label-values can span multiple lines.",
  "multi.label1": "value1",
  "multi.label2": "value2",
  "other": "value3"
}
```


>##    10. Создать докерфайл с nginx(который будет выводить Hello World) и передать туда в качестве аргумента лейбл build_date, также примонтировать директорию с машинки в которой будет лежать файл для nginx.

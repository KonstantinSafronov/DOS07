# HW22

>## _Task 1_

- Можно ли указать в докерфайле на базе ubuntu entrypoint sleep 20 ?

> Содержание Dockerfile:
```

FROM ubuntu
ENTRYPOINT ["sleep", "20"]

```

>## _Task 2_

- Написать Dockerfile с приложением и разместить его в изолированной сети. И можно ли в Dockerfile создать сеть?

> Взаимодействие контейнеров в разных подсетях организуется добавлением их в отдельную общую подсеть
```
docker network create [OPTIONS] NETWORK
docker network connect [OPTIONS] NETWORK CONTAINER
```

>## _Task 3_

- Написать Dockerfile с приложением и разместить его в изолированной сети. И можно ли в Dockerfile создать сеть?

>В докерфайле создание сети не описывается
Сеть создается отдельной командой, во время или после запуска контейнер можно подключить к имеющейся docker-сети либо для изоляции отключить все сети.

>## _Task 4_

- Развернуть через docker-compose example voting app, что разбирали на лекции. Сделать тоже самое без docker-compose.

> Оригинальный репозиторий доступен по ссылке - [example-voting-app](https://github.com/dockersamples/example-voting-app.git)
> Архив с репозиторием для запуска по отдельным докер-контейнерам - [t1hw21_image](https://github.com/KonstantinSafronov/DOS07/blob/HW22/HW22dir/t4/hw22t4-voting-app.tar.gz)


> Последовательность операций:
 Создаем подсети:
```
docker network create docker-back-tier
docker network create docker-front-tier
```
Собираем образы из соответствующих поддиректорий:
```
sudo docker build -t db .
sudo docker build -t redis .
sudo docker build -t vote .
sudo docker build -t result .
sudo docker build -t worker .
```
Стартуем контейнеры по очередности (имена контейнеров оставить без изменений):
```
sudo docker run -d \
  --network docker-back-tier \
  --name db \
  -v /home/cos/hw22/t4/healthchecks:/healthchecks \
  -v example-voting-app-master_db-data:/var/lib/postgresql/data \
  db

sudo docker run -d \
  --network docker-back-tier \
  -p 6379 \
  --name redis \
  -v /home/cos/hw22/t4/healthchecks:/healthchecks \
  redis
  
  sudo docker run -d \
  --network docker-back-tier \
  -p 5000:80 \
  --name vote \
  -v /home/cos/hw22/t4/vote:/app \
  vote
  
  sudo docker run -d \
  --network docker-back-tier \
  -p 5001:80 \
  -p 5858:5858 \
  --name result \
  -v /home/cos/hw22/t4/result:/app \
  result
  
  sudo docker run -d \
  --network docker-back-tier \
  --name worker \
  worker
  
sudo docker network connect docker-front-tier vote \
sudo docker network connect docker-front-tier result \
sudo docker exec -d result nodemon server.js
```
Команды для последующего запуска и остановки контейнеров:
```
sudo docker start db \
redis \
vote \
result \
worker

sudo docker stop db \
redis \
vote \
result \
worker
```

>## _Task 5_6_

- Посмотреть, что такое multistaged docker containers. Показать реализацию.
- Git Fork and Git upstream

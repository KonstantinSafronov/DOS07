# HW21

## _Task 1_

- Создать образ на основе nginx со своей страницей “hello world”

> Архив с образом доступен по ссылке - [t1hw21_image](https://github.com/KonstantinSafronov/DOS07/tree/HW21/hw21/task1hw21)
> Содержание Dockerfile:
```

FROM ubuntu

ENV TZ=Europe/Moscow

RUN apt-get update
RUN apt-get install -y nginx

RUN echo "daemon off;" >> /etc/nginx/nginx.conf
COPY ./StartPage/ /var/www/html/
COPY ./StartPage/ /usr/share/nginx/html/
CMD [ "nginx" ]

```

## _Task 2_

- Отличие ADD vs COPY

> Инструкции ADD и COPY необходимы для добавления файлов в образ.
Но с помощью инструкции ADD можно добавлять в контейнер файлы, загруженные из удалённых источников, а также распаковывать локальные .tar-файлы. Также инструкция ADD содержит символ разрыва строки — \, который может использоваться для улучшения читабельности длинных команд путём разбиения их на несколько строк.
Тем не менее рекомендуется использовать COPY.

## _Task 3_

- Отличие CMD vs ENTRYPOINT

> Инструкции CMD и ENTRYPOINT предоставляют Docker команды, которуы нужно выполнить при запуске контейнера.
Отличия:
    - В одном файле Dockerfile может присутствовать лишь одна инструкция CMD. Если в файле есть несколько таких инструкций, система проигнорирует все кроме последней.
    - Инструкция CMD может иметь exec-форму. Если в эту инструкцию не входит упоминание исполняемого файла, тогда в файле должна присутствовать инструкция ENTRYPOINT. В таком случае обе эти инструкции должны быть представлены в формате JSON.
    - Аргументы командной строки, передаваемые docker run, переопределяют аргументы, предоставленные инструкции CMD в Dockerfile. 
    - Инструкция ENTRYPOINT похожа на CMD, но параметры, задаваемые в ENTRYPOINT, не перезаписываются в том случае, если контейнер запускают с параметрами командной строки.
    Вместо этого аргументы командной строки, передаваемые в конструкции вида "docker run <image_name>", добавляются к аргументам, задаваемым инструкцией ENTRYPOINT.

## _Task 4_

- Создать контейнер и вывести hello world с CMD и ENTRYPOINT. В чем разница?
> Содержание Dockerfile:

```

FROM ubuntu

CMD ["world_in_CMD"]
ENTRYPOINT ["/bin/echo", "in_ENTRYPOINT_hello"]

```

[![t4hw21](https://github.com/KonstantinSafronov/DOS07/blob/HW21/hw21/task4hw21/t4hw21.png)](https://github.com/KonstantinSafronov/DOS07/blob/HW21/hw21/task4hw21/t4hw21.png)

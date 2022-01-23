# HW23

>## _Task 1_2_

- Развернуть систему управления конфигруацией ansible в докере и управлять нашими хостами
- Развернуть 4 виртуальные машины ubuntu и создать inventory file (db и app для дев и prod). Выполнить пинг через ansible для группы дев и прод.

> Dockerfile: [hw23t1](https://github.com/KonstantinSafronov/DOS07/blob/HW23/HW23dir/t1/Dockerfile)
> Inventoryfile: [hw23t2](https://github.com/KonstantinSafronov/DOS07/blob/HW23/HW23dir/t2/hosts)

[![hw23t1pic](https://github.com/KonstantinSafronov/DOS07/blob/HW23/HW23dir/pics/hw23pic1_1.png)](https://github.com/KonstantinSafronov/DOS07/blob/HW23/HW23dir/pics/hw23pic1_1.png)

>## _Task 3_

- Повторить пункт 2 только в докере.
> Playbok: [hw23t3](https://github.com/KonstantinSafronov/DOS07/blob/HW23/HW23dir/t2/t2playbook.yml)
[![hw23t3pic](https://github.com/KonstantinSafronov/DOS07/blob/HW23/HW23dir/pics/hw23pic1_2.png)](https://github.com/KonstantinSafronov/DOS07/blob/HW23/HW23dir/pics/hw23pic1_2.png)

>## _Task 4_5_

- Создать docker-compose file без хранения секретов, а передавать через параметры или файл
- Докеризировать bash сервис

 HW12
1) Поднять несколько виртуальных машин в одной сети, 
2) На вторую машину поставить nginx, jenkins. 

![task1_pic1](https://github.com/KonstantinSafronov/DOS07/blob/HW12/HW12dir/task1_pic1.png)
![task1_pic2](https://github.com/KonstantinSafronov/DOS07/blob/HW12/HW12dir/task1_pic2.png)
![task1_pic3](https://github.com/KonstantinSafronov/DOS07/blob/HW12/HW12dir/task1_pic3.png)
![task1_pic4](https://github.com/KonstantinSafronov/DOS07/blob/HW12/HW12dir/task1_pic4.png)

3) Просканить все порты и машины в сети одной командой.

![task3_pic1](https://github.com/KonstantinSafronov/DOS07/blob/HW12/HW12dir/task3_pic1.png)

4) Есть ip адрес 172.16.1.48 и маска подсети 255.255.224.0
- определить адрес сети в десятичном и двоичном представлении
- ip адрес первого узла подсети
- широковещательный адрес
- ip адрес последнего узла подсети

Адрес сети:
172.16.0.0
10101100.00010000.00000000.00000000
ip адрес первого узла подсети:
172.16.0.1
широковещательный адрес:
172.16.31.255
ip адрес последнего узла подсети
172.16.31.254

5) Разделить IP-сеть 192.168.16.0/24 на подсети с 100, 20, 10, 6 и 40 узлами. 
Для каждой подсети указать широковещательный адрес.

![task5_pic1](https://github.com/KonstantinSafronov/DOS07/blob/HW12/HW12dir/task5_pic1.png)

6) * Что такое сокет? Что такое сокетное соединение?
Сокет - программный интерфейс, для обмена данными между процессами, которые могут работать как на одной машине так и на разных (связываясь по сети).
Различают клинетские и серверные сокеты (отправителя и получателя).
Сокет представляет собой комбинацию ip-адреса и номера порта.
Сокетное соединение - установленное соединение между сокетом отправителя и получателя.
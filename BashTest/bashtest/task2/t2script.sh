#!/bin/bash

function IpMaskCheck {
IpMaskRegexp='((([0-1]?[0-9]?[0-9][\.]){3}([0-1]?[0-9]?[0-9]))|(([2][0-4][0-9]?[\.]){3}([2][0-4][0-9]?))|(([2][5][0-4]?[\.]){3}([2][5][0-4]?)))/(([0-2]?[0-9]$)|([3][0-2]))'
if ! echo $1 | grep -E $IpMaskRegexp>/dev/null
then
echo "entered wrong ip-address"
exit
fi

IP="$(echo $1 | cut -d '/' -f 1)"
MASK="$(echo $1 | cut -d '/' -f 2)"
}

function NetIP {

# $1 содержит ipV4
IP_ADDRESS=$1
NET_MASK=$2

# Массив с двоичными значениями 00000000, 00000001, ... 11111111
BARRAY=({0..1}{0..1}{0..1}{0..1}{0..1}{0..1}{0..1}{0..1})

# Заменяем точки на пробелы
IP_ADDRESS=${IP_ADDRESS//./ }

# Преобразуем октеты IP-адреса в бинарный вид
BINARY_IP_ADDRESS=$(for octet in $IP_ADDRESS; do echo -n ${BARRAY[octet]}" "; done)

# Разделяем побитово и помещаем в массив
BIN_IP_SEP1=${BINARY_IP_ADDRESS//1/1 }
BINARY_IP_ARRAY=( ${BIN_IP_SEP1//0/0 } )





# Считаем адрес подсети
NET_ADDRESS=""
for i in {0..31}
do
    # После каждых 8 бит ставим пробел
    [ $(($i % 8)) -ne 0 ] || NET_ADDRESS+=" "
    if [ "$i" -lt "$NET_MASK" ]
    then
	# Пока очередной бит в маске подсети равен 1, добавляем бит из адреса
        NET_ADDRESS+="${BINARY_IP_ARRAY[$i]}"
    else
        # Аосле - добавляем 0
        NET_ADDRESS+="0"
    fi
done

# Ковертируем значения октетов в десятичные значения
DECIMAL_ADDRESS=`echo $(for octet in $NET_ADDRESS; do echo $((2#$octet)); done)`
# Заменяем пробелы на точки
DECIMAL_ADDRESS=${DECIMAL_ADDRESS// /.}
IP_ADDRESS=${IP_ADDRESS// /.}

if [ "$IP_ADDRESS" = "$DECIMAL_ADDRESS" ]
then
        echo "net address - $DECIMAL_ADDRESS"
else
	echo "Entered ip-addres isn't SubNet-addres"
	exit
fi

}

echo -n "Enter SubNet IP-address:"
read -r IpAdd
IpMaskCheck $IpAdd
NetIP $IP $MASK

nmap -sn $IpAdd | grep "report" | awk '{print $NF}' | awk '{ gsub(/\(/, ""); gsub(/\)/, ""); print}' > `pwd`/HostList

for HostIp in $(cat `pwd`/HostList)
do
	scp `pwd`/file2copy uuser@$HostIp:/tmp/file2copy 2>/dev/null
	if [ $(echo $?) -eq 0 ]
        then 
	ssh uuser@$HostIp '/tmp/file2copy'
	mkdir `pwd`/$HostIp
	scp uuser@$HostIp:/tmp/MemUsageTop.txt `pwd`/$HostIp
	ssh uuser@$HostIp 'rm /tmp/file2copy; rm /tmp/MemUsageTop.txt'
	fi
done
rm `pwd`/HostList



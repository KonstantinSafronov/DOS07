# Test Linux Utilites

- 1 Curl -O https://github.com/hashicorp/vagrant

- 2 ssh keygen -b 4096
ssh-copy-id username@remote_host

- 3 curl -z 31-Jan-18 -O http://ftp.byfly.by/pub/CentOS/7/updates/x86_64/repodata/repomd.xml

- 4 curl --limit-rate 50K -O http://ftp.byfly.by/pub/CentOS/7/updates/x86_64/repodata/repomd.xml

- 5 sudo touch /etc/opt/test_task5.txt ; sudo find . -maxdepth 3 -name "test_task5.txt" -exec rm {} \;

- 6 find /tmp -type f -empty

- 8 PS1='t [[e[0;32m]u[e[m]@e[0;37m]h[e[m] [e[1;34m]w[e[m]][e[0;31m] $[e[m][e[0;37m] '

- 9 stat filename > file.info

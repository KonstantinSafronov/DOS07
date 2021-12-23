# HW19

>## _Task 1_

- Написать функцию, которая проверяет ввод с клавиатуры. Если ввели Y|y - продолжаем выполнение, если N|n - останавливаем.


>## _Task 2_

- Написать скрипт, которые пробегается по файлам в директории и если есть файлы, в конце которых имя _autorun запускает их. Запускать скрипт раз в 15 минут.

>## _Task 3_

- Есть json
{
  "Version":"2012-10-17",
  "Statement":[
    {
      "Sid":"AddCannedAcl",
      "Effect":"Allow",
    "Principal": {"AWS": ["arn:aws:iam::111122223333:root","arn:aws:iam::444455556666:root"]},
      "Action":["s3:PutObject","s3:PutObjectAcl"],
      "Resource":"arn:aws:s3:::DOC-EXAMPLE-BUCKET/*",
      "Condition":{"StringEquals":{"s3:x-amz-acl":["public-read"]}}
    }
  ]
}

Нужно написать скрипт, который проверяет данный json файл и заменяет строки Resource":"arn:aws:s3:::DOC-EXAMPLE-BUCKET/* на строку с именем вашего бакета и добавляет "arn:aws:iam::777777777777:root" в строку     "Principal": {"AWS": ["arn:aws:iam::111122223333:root","arn:aws:iam::444455556666:root"]}

{
  "Version":"2012-10-17",
  "Statement":[
    {
      "Sid":"AddCannedAcl",
      "Effect":"Allow",
    "Principal": {"AWS": ["arn:aws:iam::111122223333:root","arn:aws:iam::444455556666:root", "arn:aws:iam::111122223333:root","arn:aws:iam::444455556666:root"]},
      "Action":["s3:PutObject","s3:PutObjectAcl"],
      "Resource":"arn:aws:s3:::DimaTest/*",
      "Condition":{"StringEquals":{"s3:x-amz-acl":["public-read"]}}
    }
  ]
}

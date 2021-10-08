#!/bin/sh

user='' # Пользователь MySQL
password='' # Пароль от MySQL

mkdir backup
YADISC_DIR='mysql_dumps/'$(date '+%Y-%m-%d_%H:%M:%S')

mysql -s -r -u $user -p$password -e 'show databases' | while read db; do mysqldump -u $user -p$password $db -r backup/${db}.sql; done
zip -r files.zip backup
/usr/bin/ydcmd put files.zip $YADISC_DIR --skip-hash --progress

rm files.zip backup -r

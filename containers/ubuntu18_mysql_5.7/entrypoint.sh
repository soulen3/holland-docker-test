#!/usr/bin/env bash

mkdir -p /var/log/mysql/
touch /var/log/mysql/error.log
chown -R mysql:mysql /var/log/mysql

rm -rf /var/lib/mysql/*
mysqld --initialize-insecure --user=mysql 2>>/dev/null >>/dev/null
mkdir -p /var/run/mysqld
chown -R mysql:mysql /var/lib/mysql /var/run/mysqld
mysqld_safe --user=mysql 2>>/dev/null >>/dev/null &
sleep 20


cd /test_db
mysql < employees.sql 2>>/dev/null >>/dev/null

cd /
git clone $FORK 2>>/dev/null >>/dev/null

cd /holland
git checkout $BRANCH 2>>/dev/null >>/dev/null

python3 setup.py install 2>>/dev/null >>/dev/null
for i in `ls -d /holland/plugins/holland.*`
do
    cd ${i}
    python3 setup.py install 2>>/dev/null >>/dev/null
done

mkdir -p /etc/holland/providers /etc/holland/backupsets /var/log/holland /var/spool/holland
cp /holland/config/holland.conf /etc/holland/
cp /holland/config/providers/* /etc/holland/providers/

CMDS=(
"holland mc --name mysqldump mysqldump"
"holland bk mysqldump --dry-run"
"holland bk mysqldump"
)

for command in "${CMDS[@]}"
do
    $command 2>>/dev/null >>/dev/null
    if [ $? -ne  0 ]
    then
        echo "$NAME Failed: \"$command\""
    fi
done

if [[ $DEBUG == 'True' ]]
then
    echo $NAME
    cat /var/log/holland/holland.log
fi

#!/usr/bin/env bash

rm -rf /var/lib/mysql/*
mysqld --initialize-insecure --user=mysql 2>>/dev/null >>/dev/null
chown -R mysql:mysql /var/lib/mysql 2>>/dev/null >>/dev/null
mysqld --user=mysql --explicit_defaults_for_timestamp 2>>/dev/null >>/dev/null &
sleep 20

mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY ''"
cd /test_db
mysql < employees.sql 2>&1 >>/dev/null

cd /
git clone $FORK 2>>/dev/null >>/dev/null
cd /holland
git checkout $BRANCH 2>>/dev/null >>/dev/null
python setup.py install 2>>/dev/null >>/dev/null
for i in `ls -d /holland/plugins/holland.*`
do
    cd ${i}
    python setup.py install 2>>/dev/null >>/dev/null
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

#!/usr/bin/env bash

rm -rf /var/lib/mysql/*
mysql_install_db --force 2>>/dev/null >>/dev/null
chown -R mysql:mysql /var/lib/mysql
mysqld_safe --datadir='/var/lib/mysql' --user=mysql 2>>/dev/null >>/dev/null & 
sleep 20

cd /test_db
mysql < employees.sql 2>&1 >>/dev/null

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
"holland mc --name mariabackup mariabackup"
"holland bk mariabackup --dry-run"
"holland bk mariabackup"
)

FAIL=0
for command in "${CMDS[@]}"
do
    $command 2>>/dev/null >>/dev/null
    if [ $? -ne  0 ]
    then
        echo "$NAME Failed: \"$command\""
        FAIL=1
    fi
done

if [[ $DEBUG == 'True' ]]
then
    echo $NAME
    cat /var/log/holland/holland.log
fi
exit $FAIL

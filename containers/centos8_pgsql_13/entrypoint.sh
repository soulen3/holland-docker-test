#!/usr/bin/env bash

su -c /usr/pgsql-13/bin/initdb -l postgres 2>>/dev/null >>/dev/null
echo 'host all root 127.0.0.1/32 trust' >> /var/lib/pgsql/13/data/pg_hba.conf 2>>/dev/null >>/dev/null
su -c '/usr/pgsql-13/bin/pg_ctl -D /var/lib/pgsql/13/data start' postgres 2>>/dev/null >>/dev/null
sleep 20
su -c '/usr/pgsql-13/bin/psql -c "CREATE USER root WITH SUPERUSER"' postgres 2>>/dev/null >>/dev/null


# Clone the Holland repo and install the base application
git clone $FORK /holland 2>>/dev/null >>/dev/null
cd /holland 2>>/dev/null >>/dev/null
git checkout $BRANCH 2>>/dev/null >>/dev/null
python3 setup.py install 2>>/dev/null >>/dev/null

# Install Holland pgdump plugin
cd /holland/plugins/holland.lib.common 2>>/dev/null >>/dev/null
python3 setup.py install 2>>/dev/null >>/dev/null
cd /holland/plugins/holland.backup.pgdump 2>>/dev/null >>/dev/null
python3 setup.py install  2>>/dev/null >>/dev/null

# Prep filesystem for holland installation
mkdir -p /etc/holland/{backupsets,providers} /var/log/holland /var/spool/holland 2>>/dev/null >>/dev/null
cp /holland/config/holland.conf /etc/holland/holland.conf 2>>/dev/null >>/dev/null
cp /holland/config/providers/pgdump.conf /etc/holland/providers/pgdump.conf 2>>/dev/null >>/dev/null

# Create backup set, ensure initial check passed, then run backup
CMDS=(
"holland mc --name pgdump pgdump"
"holland bk pgdump --dry-run"
"holland bk pgdump"
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

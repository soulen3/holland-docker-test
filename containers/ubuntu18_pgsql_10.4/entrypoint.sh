#!/usr/bin/env bash

# Configure PostgreSQL install and import sample data
echo 'host all root 127.0.0.1/32 trust' >> /etc/postgresql/10/main/pg_hba.conf 2>>/dev/null >>/dev/null
service postgresql restart 2>>/dev/null >>/dev/null
su -c 'psql -c "CREATE USER root WITH SUPERUSER"' postgres 2>>/dev/null >>/dev/null

mkdir /sqlsample 2>>/dev/null >>/dev/null
wget http://pgfoundry.org/frs/download.php/527/world-1.0.tar.gz -O /sqlsample/world.tar.gz 2>>/dev/null >>/dev/null
cd /sqlsample 2>>/dev/null >>/dev/null
tar -xzf world.tar.gz 2>>/dev/null >>/dev/null

su -c 'psql -c "CREATE DATABASE world"' postgres 2>>/dev/null >>/dev/null
su -c 'psql -d world < dbsamples-0.1/world/world.sql' postgres 2>>/dev/null >>/dev/null

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
    if [ ! $? ]
    then
        echo "$NAME Failed: \"$command\""
    fi
done

if [[ $DEBUG == 'True' ]]
then
    echo $NAME
    cat /var/log/holland/holland.log
fi

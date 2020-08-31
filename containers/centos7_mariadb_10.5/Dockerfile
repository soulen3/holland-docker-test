From centos:7

RUN yum install -y epel-release
RUN yum upgrade -y
RUN yum install -y wget git python3-setuptools gcc python3-devel python3-configobj python3-mock python36-mysql
ADD ./mariadb.repo /etc/yum.repos.d/mariadb.repo
RUN wget -O /tmp/RPM-GPG-KEY-MariaDB https://mirror.jaleco.com/mariadb/yum/RPM-GPG-KEY-MariaDB
RUN rpm --import  /tmp/RPM-GPG-KEY-MariaDB
RUN yum install -y MariaDB-server MariaDB-client MariaDB-devel MariaDB-backup
RUN git clone https://github.com/datacharmer/test_db.git
ADD my.cnf /root/.my.cnf
ADD ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
CMD /entrypoint.sh

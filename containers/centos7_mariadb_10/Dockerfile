From centos:7

RUN yum install -y epel-release
RUN yum install -y wget git python-setuptools gcc python-devel python-configobj python2-mock python2-subprocess32
ADD ./mariadb.repo /etc/yum.repos.d/mariadb.repo
RUN rpm --import https://yum.mariadb.org/RPM-GPG-KEY-MariaDB
RUN yum install -y MariaDB-server galera MariaDB-client MariaDB-shared MariaDB-backup MariaDB-common
RUN yum install -y MySQL-python
RUN git clone https://github.com/datacharmer/test_db.git
ADD ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
CMD /entrypoint.sh

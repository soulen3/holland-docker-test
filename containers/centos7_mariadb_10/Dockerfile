From centos:7

RUN yum install -y epel-release
RUN yum upgrade -y
RUN yum install -y wget git python3-setuptools gcc python3-devel python3-configobj python3-mock python36-mysql
ADD ./mariadb.repo /etc/yum.repos.d/mariadb.repo
RUN rpm --import https://yum.mariadb.org/RPM-GPG-KEY-MariaDB
RUN yum install -y MariaDB-server galera MariaDB-client MariaDB-shared MariaDB-backup MariaDB-common
RUN git clone https://github.com/datacharmer/test_db.git
ADD ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
CMD /entrypoint.sh

From centos:7

RUN yum install -y https://centos7.iuscommunity.org/ius-release.rpm
RUN yum install -y mariadb100u-server mariadb100u-devel git python-setuptools gcc python-devel
RUN yum install -y http://www.percona.com/downloads/percona-release/redhat/0.1-4/percona-release-0.1-4.noarch.rpm
RUN yum install -y percona-xtrabackup-24
RUN easy_install six
RUN easy_install future
RUN easy_install ConfigParser
RUN easy_install mysql-python
RUN git clone https://github.com/datacharmer/test_db.git
ADD ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
RUN chown -R mysql:mysql  /var/log/mariadb
RUN touch /var/log/mariadb/mariadb.log
RUN chown -R mysql:mysql /var/log/mariadb
CMD /entrypoint.sh

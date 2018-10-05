From centos:7

RUN yum install -y https://centos7.iuscommunity.org/ius-release.rpm
RUN yum install -y mariadb100u-server mariadb100u-devel git python-setuptools gcc python-devel python-configobj
RUN yum install -y MySQL-python
RUN yum install -y http://www.percona.com/downloads/percona-release/redhat/0.1-4/percona-release-0.1-4.noarch.rpm
RUN yum install -y percona-xtrabackup-24
RUN git clone https://github.com/datacharmer/test_db.git
ADD ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
CMD /entrypoint.sh

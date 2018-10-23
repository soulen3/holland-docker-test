From centos:7

RUN yum install -y epel-release
RUN yum install -y mariadb-server mariadb-devel git python-setuptools gcc python-devel MySQL-python python-configobj python2-mock
RUN yum install -y http://www.percona.com/downloads/percona-release/redhat/0.1-4/percona-release-0.1-4.noarch.rpm
RUN yum install -y percona-xtrabackup-24
RUN yum install -y https://centos7.iuscommunity.org/ius-release.rpm
RUN git clone https://github.com/datacharmer/test_db.git
ADD ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
CMD /entrypoint.sh

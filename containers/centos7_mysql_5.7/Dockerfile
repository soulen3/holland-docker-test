From centos:7

RUN yum install -y wget
ADD ./mysql.repo /etc/yum.repos.d/mysql.repo
RUN wget -O /tmp/RPM-GPG-KEY-mysql http://repo.mysql.com/RPM-GPG-KEY-mysql
RUN rpm --import  /tmp/RPM-GPG-KEY-mysql
RUN yum install -y mysql-community-server mysql-community-devel git python-setuptools gcc python-devel mysql-community-libs
#RUN yum install -y http://www.percona.com/downloads/percona-release/redhat/0.1-4/percona-release-0.1-4.noarch.rpm
#RUN yum install -y percona-xtrabackup
RUN easy_install six
RUN easy_install future
RUN easy_install ConfigParser
RUN easy_install mysql-python
RUN git clone https://github.com/datacharmer/test_db.git
ADD ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
CMD /entrypoint.sh

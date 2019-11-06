From centos:7

RUN yum install -y epel-release
RUN yum upgrade -y
RUN yum install -y wget git python3-setuptools gcc python3-devel python3-configobj python3-mock python36-mysql

ADD ./mysql.repo /etc/yum.repos.d/mysql.repo
RUN wget -O /tmp/RPM-GPG-KEY-mysql http://repo.mysql.com/RPM-GPG-KEY-mysql
RUN rpm --import  /tmp/RPM-GPG-KEY-mysql
RUN yum install -y mysql-community-server mysql-community-devel mysql-community-libs
RUN yum install -y https://repo.percona.com/yum/percona-release-latest.noarch.rpm
RUN percona-release enable-only tools
RUN yum install -y percona-xtrabackup-80
RUN git clone https://github.com/datacharmer/test_db.git
ADD ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
CMD /entrypoint.sh

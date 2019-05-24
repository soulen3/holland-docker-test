From centos:7

RUN yum install -y wget epel-release
ADD ./mysql.repo /etc/yum.repos.d/mysql.repo
RUN wget -O /tmp/RPM-GPG-KEY-mysql http://repo.mysql.com/RPM-GPG-KEY-mysql
RUN rpm --import  /tmp/RPM-GPG-KEY-mysql
RUN yum install -y mysql-community-server mysql-community-devel git python-setuptools gcc python-devel MySQL-python python-configobj python2-mock python2-subprocess32
RUN git clone https://github.com/datacharmer/test_db.git
ADD ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
CMD /entrypoint.sh

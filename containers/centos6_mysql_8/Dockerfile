From centos:6

RUN yum install -y epel-release
RUN yum install -y wget git python-setuptools gcc python-devel python MySQL-python python-configobj python2-mock python-argparse python2-subprocess32
ADD ./mysql.repo /etc/yum.repos.d/mysql.repo
RUN wget -O /tmp/RPM-GPG-KEY-mysql http://repo.mysql.com/RPM-GPG-KEY-mysql
RUN rpm --import  /tmp/RPM-GPG-KEY-mysql
RUN yum install -y mysql-community-server mysql-community-devel mysql-community-libs MySQL-python python-configobj
RUN git clone https://github.com/datacharmer/test_db.git
ADD ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
CMD /entrypoint.sh

From centos:7

RUN yum install -y epel-release
RUN yum install -y https://centos7.iuscommunity.org/ius-release.rpm
RUN yum install -y mariadb100u-server mariadb100u-devel git python-setuptools gcc python-devel python-configobj python2-mock python2-subprocess32
RUN yum install -y MySQL-python
RUN git clone https://github.com/datacharmer/test_db.git
ADD ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
CMD /entrypoint.sh

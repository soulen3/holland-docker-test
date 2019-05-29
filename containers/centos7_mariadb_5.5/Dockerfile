From centos:7

RUN yum install -y epel-release
RUN yum install -y mariadb-server mariadb-devel git python-setuptools gcc python-devel MySQL-python python-configobj python2-mock python2-subprocess32
RUN git clone https://github.com/datacharmer/test_db.git
ADD ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
CMD /entrypoint.sh

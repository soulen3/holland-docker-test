From centos:6

RUN yum install -y epel-release
RUN yum install -y mysql-server mysql-devel git python-setuptools gcc python-devel python MySQL-python python-configobj python2-mock python-argparse
RUN git clone https://github.com/datacharmer/test_db.git
ADD ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
CMD /entrypoint.sh

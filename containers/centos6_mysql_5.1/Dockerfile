From centos:6

RUN yum install -y mysql-server mysql-devel git python-setuptools gcc python-devel

RUN easy_install six
RUN easy_install future
RUN easy_install ConfigParser
RUN easy_install mysql-python
RUN git clone https://github.com/datacharmer/test_db.git
ADD ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
CMD /entrypoint.sh

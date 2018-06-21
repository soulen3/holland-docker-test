From debian:jessie 

RUN apt-get update
RUN echo "mysql-server-5.7 mysql-server/root_password password ''" | debconf-set-selections
RUN echo "mysql-server-5.7 mysql-server/root_password_again password ''" | debconf-set-selections
RUN apt-get --yes install mysql-server
RUN apt-get --yes install python-pip git python-setuptools gcc
RUN pip install six
RUN pip install future
RUN pip install ConfigParser
RUN apt-get --yes install python-mysqldb
RUN git clone https://github.com/datacharmer/test_db.git
ADD ./entrypoint.sh /entrypoint.sh
CMD /entrypoint.sh

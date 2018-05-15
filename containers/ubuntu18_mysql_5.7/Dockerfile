From ubuntu:18.04

RUN apt-get update
RUN apt-get --yes install mysql-server git python3-setuptools gcc
RUN apt-get --yes install python3-pip

RUN pip3 install six
RUN pip3 install future
RUN pip3 install ConfigParser
RUN apt-get --yes install python3-mysqldb
RUN git clone https://github.com/datacharmer/test_db.git
ADD ./entrypoint.sh /entrypoint.sh
CMD /entrypoint.sh

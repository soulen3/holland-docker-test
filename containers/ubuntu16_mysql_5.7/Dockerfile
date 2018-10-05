From ubuntu:16.04

RUN apt-get update
RUN apt-get --yes install git python3-setuptools gcc python3-pip python3-mysqldb python3-configobj
RUN echo "mysql-server-5.7 mysql-server/root_password password ''" | debconf-set-selections
RUN echo "mysql-server-5.7 mysql-server/root_password_again password ''" | debconf-set-selections
RUN apt-get --yes install mysql-server 
RUN git clone https://github.com/datacharmer/test_db.git
ADD ./entrypoint.sh /entrypoint.sh
CMD /entrypoint.sh

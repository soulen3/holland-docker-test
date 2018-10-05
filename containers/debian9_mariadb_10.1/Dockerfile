From debian:stretch

RUN apt-get update
RUN apt-get --yes install mysql-server git python3-setuptools gcc python3-pip python3-mysqldb python3-configobj
RUN git clone https://github.com/datacharmer/test_db.git
ADD ./entrypoint.sh /entrypoint.sh
CMD /entrypoint.sh

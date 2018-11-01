FROM centos:6

RUN yum install -y epel-release
RUN yum install -y postgresql-server python-setuptools python-psycopg2 git wget python-configobj python-argparse
ADD ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
CMD /entrypoint.sh

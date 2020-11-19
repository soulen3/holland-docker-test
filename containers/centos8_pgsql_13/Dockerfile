FROM centos:8

RUN yum install -y epel-release glibc-langpack-en
RUN yum upgrade -y
RUN yum install -y wget git python3-setuptools gcc python3-devel python3-configobj
RUN yum install -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-8-x86_64/pgdg-redhat-repo-latest.noarch.rpm
RUN yum install -y python3-psycopg2
RUN dnf -qy module disable postgresql
RUN dnf install -y postgresql13-server
RUN mkdir -p /usr/local/lib/python3.6/site-packages/
ADD ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
CMD /entrypoint.sh

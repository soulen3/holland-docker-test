FROM ubuntu:16.04

RUN apt-get update && apt-get install -y postgresql python3-setuptools python3-psycopg2 git wget
RUN rm -rf /var/cache/apt/

ADD ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
CMD /entrypoint.sh

FROM debian:buster
RUN apt-get update
RUN apt-get install gettext-base procps -y
RUN apt-get install mariadb-server mariadb-client -y
RUN apt-get install net-tools -y

RUN mkdir -p /var/lib/mysql
RUN mkdir -p /run/mysqld
RUN chown -R mysql:root /run/mysqld
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY tools/conf.sh /var/conf.sh
HEALTHCHECK --interval=15s --timeout=10s --start-period=20s --retries=3 CMD [ "netstat", "-lnutp", "|", "grep", "3306" ]
CMD [ "sh", "/var/conf.sh" ]
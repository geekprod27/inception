FROM debian:buster
RUN apt update && apt upgrade -y
RUN apt-get -y install wget
RUN apt-get install -y php7.3 php-fpm php7.3-cli php-mysql mariadb-client
RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz
COPY conf/www.conf etc/php/7.3/fpm/pool.d/www.conf
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
RUN mkdir -p /run/php
COPY conf/auto_config.sh auto_config.sh
ENTRYPOINT [ "sh", "auto_config.sh" ]
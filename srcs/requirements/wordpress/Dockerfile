FROM debian:buster
RUN apt update && apt install -y nginx
RUN apt-get -y install wget
RUN apt-get install -y php php7.3 \
php7.3-fpm \
php7.3-mysql php7.3-cli php7.3-common \
mariadb-client
RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz
RUN chown -R root:root /var/www/wordpress
COPY conf/www.conf etc/php/7.3/fpm/poll.d/www.conf
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
RUN mkdir -p /run/php
COPY conf/auto_config.sh auto_config.sh
ENTRYPOINT [ "sh", "auto_config.sh" ]
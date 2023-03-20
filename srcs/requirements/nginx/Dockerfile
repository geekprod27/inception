FROM debian:buster
RUN apt update -y && apt upgrade -y && apt install -y nginx
RUN mkdir -p /etc/nginx/ssl
RUN apt install openssl -y
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/OU=42/CN=nfelsemb.42.fr/UID=nfelsemb"
RUN mkdir -p /var/run/nginx
COPY conf/nginx.conf /etc/nginx/nginx.conf
EXPOSE 443
CMD [ "/usr/sbin/nginx", "-g", "daemon off;" ]
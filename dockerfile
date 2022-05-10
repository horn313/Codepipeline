FROM ubuntu:latest


RUN apt-get -y update
RUN apt-get install -y nginx

ADD ./nginx/nginx/ /etc/nginx/
ADD ./nginx/html/ /usr/share/nginx/html/

RUN apt-get install -y apache2

ADD ./apache/000-default.conf /etc/apache2/sites-enabled/
ADD ./apache/ports.conf /etc/apache2/
ADD ./apache/apache2.conf /etc/apache2/
ADD ./apache/files/info.php /var/www/html/

ADD ./script.sh /tmp/
RUN chmod +x /tmp/script.sh
RUN /tmp/script.sh

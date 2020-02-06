FROM debian:10

LABEL MAINTAINER: Rafa Carrasco

RUN     set -uex ; \
	apt update ; \
	apt-get -y install apache2 apache2-utils ; \
	rm -rf /var/lib/apt/lists/* 

ADD	https://es.wordpress.org/latest-es_ES.tar.gz /var/www/html/

EXPOSE 80
ENTRYPOINT [ "/usr/sbin/apachectl", "-D", "FOREGROUND" ]

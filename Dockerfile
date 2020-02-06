FROM debian:10

LABEL MAINTAINER: Rafa Carrasco

RUN     set -uex ; \
	apt update ; \
	apt-get -y install apache2 apache2-utils default-mysql-server wget ; \
	rm -rf /var/lib/apt/lists/*  

RUN	set -uex ; \
	wget -O- https://es.wordpress.org/latest-es_ES.tar.gz | tar zx -C /var/www/ ; \
	rm -rf /var/www/html ; \
	mv /var/www/wordpress /var/www/html ; \
	chown -R www-data:www-data /var/www/html

RUN	echo "ServerName localhost" > /etc/apache2/conf-enabled/serverName.conf

EXPOSE 80
ENTRYPOINT [ "/usr/sbin/apachectl", "-D", "FOREGROUND" ]

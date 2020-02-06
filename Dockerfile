FROM debian:10

LABEL MAINTAINER: Rafa Carrasco

RUN     set -uex ; \
        apt update ; \
        apt-get -y install apache2 apache2-utils libapache2-mod-php php-mysql php-gd php-xml php-soap php-curl wget ; \
        rm -rf /var/lib/apt/lists/*  

RUN        set -uex ; \
        wget -O- https://wordpress.org/latest.tar.gz | tar zx -C /var/www/ ; \
        rm -rf /var/www/html ; \
        mv /var/www/wordpress /var/www/html ; \
        chown -R www-data. /var/www/html ; \
        ln -sf /dev/stdout /var/log/apache2/access.log ; \
        ln -sf /dev/stderr /var/log/apache2/error.log
EXPOSE 80
ENTRYPOINT [ "/usr/sbin/apachectl", "-D", "FOREGROUND" ]

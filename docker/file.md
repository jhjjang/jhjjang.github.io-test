```
FROM ubuntu:lastes
MAINTAINER Jungho Jang <jhjjang@gmail.com>

RUN apt-get update
RUN apt-get install locales -y
RUN locale-gen ko_KR.UTF-8
RUN apt-get install git
RUN apt-get install mercurial
RUN apt-get install -y apt-transport-https
RUN apt update && apt-get install -y apache2
#RUN apt-get install mysql-client-core-5.6 mysql-client-5.6 mysql-server-5.6
RUN add-apt-repository ppa:ondrej/php
RUN apt update && apt install php5.7 libapache2-mod-php5.6 php5.6-curl php5.6-gd php5.6-mbstring php5.6-mcrypt php5.6-mysql php5.6-xmlrpc php5.6-memcache php5.6-memcached
#RUN apt install libapache2-mod-php7.0 php7.0 php7.0-cli php-xdebug php7.0-mbstring sqlite3 php7.0-mysql php-imagick php-memcached php-memcache php-pear curl imagemagick mcrypt php7.0-mcrypt php7.0-dev php7.0-phpdbg php7.0-gd npm php7.0-json php7.0-curl php7.0-sqlite3 php7.0-intl git-core wget libsasl2-dev libssl-dev libsslcommon2-dev libcurl4-openssl-dev autoconf g++ make openssl libssl-dev libcurl4-openssl-dev pkg-config libsasl2-dev libpcre3-dev

RUN a2dismod php7.0
RUN a2enmod php5.6
RUN adenmod rewrite
RUN apt-get intall langauge-pack-ko-base

ENV LANG ko_KR.UTF-8
ENV LC_ALL ko_KR.UTF-8

EXPOSE 80
EXPOSE 443
```

FROM ubuntu:lastes
MAINTAINER Jungho Jang <jhjjang@gmail.com>

RUN apt-get update
RUN apt-get install git
RUN apt-get install mercurial
RUN apt-get install -y apt-transport-https
RUN apt update && apt-get install -y apache2
#RUN apt-get install mysql-client-core-5.6 mysql-client-5.6 mysql-server-5.6
RUN add-apt-repository ppa:ondrej/php
RUN apt update && apt install php5.7 libapache2-mod-php5.6 php5.6-curl php5.6-gd php5.6-mbstring php5.6-mcrypt php5.6-mysql php5.6-xmlrpc php5.6-memcache php5.6-memcached
RUN a2dismod php7.0
RUN a2enmod php5.6
RUN adenmod rewrite
RUN apt-get intall langauge-pack-ko-base

EXPOSE 80
EXPOSE 443

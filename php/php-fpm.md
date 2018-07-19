## setup 순서
1. vi /etc/apt/sources.list
2. add content to sources.list blow conents

- deb http://mirrors.digitalocean.com/ubuntu trusty main multiverse
- deb http://mirrors.digitalocean.com/ubuntu  trusty-updates main multiverse
- deb http://security.ubuntu.com/ubuntu  trusty-security main multiverse


3. apt-get update
4. apt-get install python-software-properties
5. apt-get install software-properties-common
6. apt-get install add-apt-repository ppa:ondrej/php
6. apt-get update
7. apt-get install libapache2-mod-fastcgi php5.6-fpm php5.6 php5.6-dev php5.6-mcrypt php5.6-mbstring php5.6-mysql php5.6-zip php5.6-gd php5.6-xml php7.0-fpm libapache2-mod-fastcgi php7.0-fpm php7.0 php7.0-dev php7.0-mbstring php7.0-mysql php7.0-zip php7.0-gd php7.0-xml php7.0-curl php7.0-intl php7.0-json php7.0-mcrypt

8. a2enmod actions fastcgi
9. a2enmod proxy proxy_fcgi

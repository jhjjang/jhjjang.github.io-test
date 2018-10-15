
1. apt-get install openssl
2. openssl genrsa -des3 -out server.key 2048
3. openssl req -new -days 36500 -key server.key -out server.csr
4. cp server.key server.key.org
5. openssl rsa -in server.key.org -out server.key
6. openssl x509 -req -days 36500 -in server.csr -signkey server.key -out server.crt
7. openssl x509 -in server.crt -out server.der -outform DER
8. openssl x509 -in server.crt -text
9. openssl x509 -in server.der -inform DER -text
10. a2enmod ssl
11. service apache2 restart
12. cp /etc/apache2/sites-available/default-ssl /etc/apache2/sites-available/example.com.conf
13. vi /etc/apache2/sites-available/example.com 
    SSLEngine on SSLCertificateFile /etc/apache2/ssl/server.crt 
    SSLCertificateKeyFile /etc/apache2/ssl/server.key
14. a2ensite example.com
15. service apache2 restart


[참조](http://webdir.tistory.com/228)

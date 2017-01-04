#### Jenkins 설치

> $ docker run -p 8080:8080 -v /docker/jenkins:/var/jenkins_home -u root jenkins

#### mysql 설치

> $ docker run -d --name mysql -e MYSQL_ROOT_PASSWORD=secret -e MYSQL_DATABASE=redmine mysql

#### Redmine 설치

> $docker run -d --name redmine -p 3000:3000 --link mysql:mysql redmine


#### 접속하기

> - http://192.168.99.100:3000/
> - 초기 패스워드는 admin // admin

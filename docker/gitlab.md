sameersbn:gitlab 을 이용하여 도커에서 gitlab 운영하기
==================================================

## Flow
> redis 설치 및 기동 -> Database 준비 -> gitlab 설치 -> gitlab시작

#### *Install redis*

sameersbn 을 사용하지 않을 경우, 원하는 이미지로 변경해서 사용한다.
```
$ sudo docker pull sameersbn/redis:latest
$ sudo docker run --name=REDIS -d sameersbn/redis
$ sudo docker stop REDIS
$ sudo docker commit REDIS redsable/redis
$ sudo docker rm REDIS
$ sudo docker run --name REDIS -d redsable/redis:0.1 
```


#### *DB 준비*

여기서는 MariaDB를 기준으로 설명한다.
```
$ mysql -uroot -p mysql
MariaDB[mysql]> create user 'gitlab'@'%.%.%.%' identified by '비밀번호';
MariaDB[mysql]> create database if not exists `gitlabhq_production` default char set `utf8` collate `utf8_unicode_ci`;
MariaDB[mysql]> grant all privileges on `gitlabhq_production`.* to 'gitlab'@'%.%.%.%';
```
DB User , Database 는 적당히 알아서 바꾼다.

#### *Install Gitlab*

```
$ sudo docker pull sameersbn/gitlab:latest
$ sudo docker run -d --name=GITLAB \
--env 'GITLAB_HOST=사용할 호스트' \
--env 'GITLAB_SSH_PORT=git으로 연결할 ssh 포트' \
--env 'SMTP_USER=관리자로 사용될 이메일 (Gmail추천)' \
--env 'SMTP_PASS=이메일 비밀번호' \
--env 'GITLAB_PROJECTS_MERGE_REQUESTS=true' \
--env 'DB_HOST=DB 주소' \
--env 'DB_NAME=gitlabhq_production' \
--env 'DB_USER=gilab' \
--env 'DB_PASS=비밀번호' \
--env 'DB_TYPE=mysql' \
--env 'GITLAB_SECRET_DB_KEY_BASE=키로 사용될 문자'
--volume /usr/local/gitlab:/home/git/data \
--link REDIS:redisio \
-p 10080:80 \
-p 10082:22 \
--memory='2g' \
sameersbn/gitlab:latest
```

- –env ‘GITLAB_SECRET_DB_KEY_BASE=키로 사용될 문자’ 이 옵션은 CentOS에서만 필요한 옵션 같음.
- memory를 잡는 이유는 GitLAB 권장 메모리가 2g 임 .

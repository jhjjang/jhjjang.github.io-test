### 레드마인 플러그인 설치
```
1. 다운받은 redmine plugin을 /opt/bitnami/redmine/plugins 에 설치한다 (redmine_agile)
2. 해당 plugin 폴더에 들어간다 (cd /bitnami/redmine/plugins/redmine_agile)
3. bundle install --no-deployment 실행
4. 레드마인 root 폴더로 이동한다 (cd /opt/bitnami/redmine)
5. bundle exec rake redmine:plugins:migrate RAILS_ENV=production 실행.
```

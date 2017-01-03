### 레드마인 플러그인 (CKEditor)설치

#### 1. 플러그인폴더로 이동한다.
 
 > cd /usr/src/redmine/plugins

#### 2. 플러그인 git clone 하기
 
 > git clone https://github.com/a-ono/redmine_ckeditor.git

#### 3. 설치하기

 > - 먼저 다음 명령을 수행합니다. 이 명령을 수행하지 않아 계속 제대로 설치가 되지 않았습니다
 > - bundle install --no-deployment
 > - bundle install --without development test
 > - rake redmine:plugins:migrate RAILS_ENV=production
 
#### 4. 레드마인 재시작

#### 5. 설정하기

 > - Redmine에서 상단 메뉴의 관리 > 설정으로 이동
 > - 첫번째 탭인 일반의 아랫 본문 형식이라는 select box
 > - CKeditor를 선택

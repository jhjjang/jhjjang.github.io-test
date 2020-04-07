### 빌드유발
- Poll SCM
  - Schedule : H 17 * * 1-4 (월-금 17시)
 

### Execute shell
- echo "bla~ bla~~"
- git log --pretty=format:"(%ci) %s - %an" $GIT_PREVIOUS_COMMIT..$GIT_COMMIT | grep -v 'Merge branch' > diff_comment.txt
- git diff --name-only $GIT_PREVIOUS_COMMIT $GIT_COMMIT > change_files.txt
- python ./send.py


### Send build aftifact over SSH
- Source files : **/*.php **/*.js **/*.css **/_menu.ini **/_menu_v2.ini **/*.htm
- Remote directroy : test
- Exec command : rsync -razvh sorce_folder/ /target_folder

# Github 멀티계정 셋팅시
ssh-keygen -t rsa -C "첫번째 계정이메일"
==> 저장시 첫번째 계정의 키 저장 (id_rsa)


ssh-keygen -t rsa -C "두번째 계정이메일"
==> 저장시 두번째 계정의 키 저장 (id_rsa_second)

cd ~/.ssh/
touch config

config 파일에 아래내용을 추가 후 수정
# githubPersonal
Host first
    HostName github.com
    User git
    IdentityFile ~/.ssh/id_rsa

# githubWork
Host second
    HostName github.com
    User git
    IdentityFile ~/.ssh/id_rsa_second

ssh-add -D

ssh-add id_rsa
ssd-add id_rsa_second

ssh-add -l

ssh -T second

.ssh에 등록된 config파일의 계정에 따라 clone을 해준다

git clone git@계정별칭:저장소URL
ex)git clone git@Second:jhjang-dev/koreannet

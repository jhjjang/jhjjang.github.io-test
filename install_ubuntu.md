Ubuntu 설치
==============================

> *VM* 이란 물리적인 시스템 OS위에 논리적인 가상 OS를 올려서 독립적인 동작이 
> 가능하도록 하는 시스템 차원의 *가상 머신* 을 말한다.   
> 일반적으로 시스템 VM에서 VM이 설치되는 기본 OS를 +*호스트 OS*+ 라고 정의하고, 
> 호스트OS 위에 설치되는 가상 OS를 +*게스트 OS*+ 로 정의 한다.


  *VirtualBox* 는 오라클(Oracle)사에서 제공하는 오픈소스 프로젝트로 기업을 위한 
일부 기능에 대한 소스 폐쇄 외에 사용에 제한이 없는 오픈소스 라이센스 정책을 유지함에 
따라 자유롭게 이용이 가능하다.

##### VirtualBox 설치

> https://www.virtualbox.org/ 접속
> Downloads에서 ViirtualBox platform packages에서 설치 환경에 맞는 다운로드 링크 클릭
> 다운 받은 VirtualBox의 실행파일로 설치
> 설치 절차에 따라서 기본 옵션으로 설치
> 설치 경로의 변경을 원하는 경우는 두번째 화면인 " *Custom Setup* "에서 " *Location* "을 지정
> 호스트OS의 각종 주변기기를 화용하기 위해서는 *VirtualBox Extension Pack* 을 설치 해야 한다.

#### VirtualBox Extension Pack 설치

> https://www.virtualbox.org/ 접속 - Downloads
> VirtualBox Extension Pack에서 *All supported platforms* 링크 클릭
> 다운로드 받은 파일 실행
> VirtualBox - 질문 에서 설치 버튼 클릭
> 절차에 따라 설치
> 설치가 완료된 후 *파일-환경설정-확장* 에서 설치된 파일 확인
> ※ 다운로드 받은 확장팩 파일은 VirtualBox와 자동연결 되어 실행하면 자동으로 실행된다

##### VirtualBox에 Ubuntu 설치하기

http://www.ubuntu.com/download 에서 사용자 환경에 맞는 iso파일을 다운받는다.
VirtualBox 실행
새로 만들키 클릭
이름에는 본인이 알 수 있는 이름을 입력
종류는 " *Linux* " 버전은 " *Ubuntu(64 bit)* " 선택
메모리 크기 설정(사용자 환경에 따라서 1024MB ~ 2048MB 설정)
"하드 드라이브"에서 지금 새 가상 하드 디스크 만들기 선택
"하드 드라이브 파일 종류"에서 VirtualBox에서만 사용하면 VDI 선택

* (사용자가 원하는 환경에 따라 변경할 수 있다.)
물리적 하드 드라이브에 저장에서 " *고정 크기* " 선택
파일 위치 및 크기에서 가상 하드 디스크 파일의 위치와 PC환경을 고려하여 용량을 할당한다.

* (물리적 하드 드라이브의 위치를 지정해주고, 여유가 있다면 용량을 넉넉하게 할당)
설치가 완료되고 나면 " *저장소* " 를 선택
컨트롤러에서 디스크 추가 버튼을 클릭하고 다운받은 ubuntu파일(iso파일)을 *지정-확인*
VirtualBox에서 *시작* 버튼 클릭
Ubuntu가 작동하면 한국어를 선택한뒤 " *ubuntu 설치* " 선택
설치 형식에서 " *디스크를 지우고 Ubuntu 설치* "를 체크하고 지금 설치를 클릭
지역 선택 (기본으로 "Seoul"로 되어있음)
키보드 배치에서 "한국어-한국어(101/104키 호환)" 선택
사용자 계정에 대하여 이름, 비밀번호 등 알맞게 입력
설치가 완료되면 다시 재부팅되면서 " *Enter* "키를 누르라는 메세지가 나오면 "Enter"키를 누른다.
암호를 설정했다면 *사용자 정보 입력 시* 입력했던 비밀번호로 로그인한다.

##### Ubuntu 한글 설정

*설정-시스템* 설정에서 언어 지원 선택
언어지원패키지를 설치하지 않았을 경우 설치
*키보드 입력기 - iBus* 선택
터미널에서 *ibus-setup* 입력 후 엔터
입력기에서 " *한국어-Hangul* " 추가
설정-시스템 설정에서 *텍스트 입력창* 선택
사용할 입력 소스에서 "+"버튼을 누른뒤 *한국어(Hangul)* 추가
한글 선택 후 +_기존 ubuntu가 사용하는 키와 겹치지 않게_+ 원하는 단축키 설정


##### Ubuntu 기타 설정

+VirtualBox에 Ubuntu를 설치하고난 뒤 *해상도* 에 문제가 있을 경우+

VirtualBox에서 장치-게스트 확장 CD 이미지 삽입 선택
설치를 위한 비밀번호 입력
완료되면 ubuntu, windows 재부팅

##### Ubuntu 설치 및 한글 설정 관련 링크

* [VirtualBox 다운로드](https://www.virtualbox.org/wiki/Downloads)
* [Ubuntu 다운로드](https://www.ubuntu.com/download/desktop)
* [VirtualBox 설치](http://niceit.tistory.com/187)
* [Ubuntu 설치](http://blog.happydong.kr/252)
* [Ubuntu 한글 설정](http://ledgku.tistory.com/24)





Voyager 설치
=====================================

p(. 기본적으로 ubuntu 설치 과정과 유사합니다.

* 기존 windows 환경 삭제(포맷)
* 도시 - 서울
* 키보드 한국어 선택
* 이름 및 컴퓨터 이름 설정(컴퓨터 이름은 xxx-office로 통일)


#### 인터넷 연결
Ctrl-ESC
network 입력 후 network connections 선택
Wired Connection 선택 후 edit 클릭
IPv4 Setting 탭 클릭
Address, Netmask, Gateway, DNS server 각각의 알맞게 값 입력
Save 클릭

#### 디스플레이 설정
Ctrl-ESC
display 입력 후 Display 선택
디스플레이의 위치 조정
디스플레이 사용 여부, 주요 디스플레이, 같은 화면으로 복사 등 원하는 설정 체크
Apply 클릭

#### 한글 키보드
Ctrl-ESC
language 입력 후 Language Support 선택
Install / Remove Languages... 클릭
Korea 체크 후 Apply
Keyboard input method system fcitx 선택
close 클릭

#### workspace
화면 가장 우측 workspace 영역 우클릭
Properties(속성) 선택
줄 수를 2로 바꾸고 닫기

#### 터미널 단축키 설정
상단 터미널 아이콘(초록색 아래 방향 기호) 우클릭
Properties(속성) 선택
터미널이 선택 된 상태에서 우측 아래 edit(편집) 클릭
command(명령) 내용 복사
Ctrl-ESC에서 keyboard 입력 후 keyboard 선택
바로가기에서 add(추가) 버튼 클릭
복사 한 command 붙여 넣고 원하는 단축키 입력
확인


#### VirtualBox  설치(Windows7)

> p(. 기존 VirtualBox 설치와 동일합니다.

VirtualBox 홈페이지에서 Download
Linux distributions 선택
Ubuntu 16.04 - AMD64 선택
다운로드 후 설치
VirtualBox Extension Pack - All supported platforms 클릭
Extension Pack 설치

#### 프린터 설정

p(. 윈도우 환경에서 설정

드라이버 다운로드
** 신도리코 홈페이지에서 D410 드라이버 컴퓨터 환경에 맞게 다운로드
설치
ip설정을 자동이 아닌 수동으로 설정(210.121.151.100)
테스트 페이지 인쇄


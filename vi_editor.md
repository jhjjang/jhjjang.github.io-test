vi 학습
=================================

>Linux 터미널 환경에서는 GUI를 이용할 수 없기 때문에 
>터미널에서 텍스트 편집을 할 수 있는 +*vi(vim)*+ 를 사용해야한다.

### vi(vim) 개요

*개요*
      
    UNIX 계열 운영체제에서 주로 쓰이는 유서깊은 오픈 소스 텍스트 에디터. " _*Visual editor*_ "라는 뜻이다. 
원칙적으로 텍스트 모드에서 작동하도록 만들어졌기 때문에 어떠한 플랫폼 용 버전을 사용해도 기본적으로 모든 GUI가 텍스트 문자로 이루어져 있다.
" _*vim*_ " 은 유닉스 계열에서 전통적으로 널리 사용도던 vi 의 improve 즉 undo, syntax coloring, split windows 등의 기능을 
포함시킨 vi 의 보강된 프로그램이다.

*장점*

    커서 이동을 비롯하여 대부분의 편집 명령어가 키보드 중심에 몰려있고, 모드를 이용하여 키조합을 하지 않아도
 되는 경우가 많기 때문에 같은 작업을 해도 타 에디터에 비해 손동작이나 타수가 크게 줄어든다.
*단점*

    많은 명령어들을 외워야 한다.

### vi 학습

* *일반 모드*  
  다양한 편집기능을 적용할 수 있는 모드이다. 입력모드에서 ESC키를 눌러 전환

* *입력(텍스트) 모드*  
  데이터를 입력하는 에디팅을 위한 모드이다. 명령모드에서 특정키를 눌러 전환  

* *명령 모드*    
  편집을 끝낸 vi에디터의 저장 및 종료를 위한 모드이다. 명령모드에서 콜론(:)을 눌러 전환

* *옵션* (_10/31 update_)

bq. vi 환경에서 작업할 때 사전에 설정해 두면 편리한기능을 'set'으로 설정할 수 있습니다.

      [vi 옵션](http://kuroikuma.tistory.com/27)

|_.명령어               |_.설명                                                             |
|=.:set ai(autoindeant) | 윗라인과 같이 자동으로 들여쓰기                                   |
|=.:set ts=4(tabstop)  | 'tab'키를 입력 하였을 때 이동하는 키기를 조정                      |
|=.:set et(expandtab)  | 'tab'키를 입력 하였을때 'tab'에 대응하는 'space'만큼 이동          |
|=.:set si              | if 또는 for문을 입력하고 다음라인 이동시 들여쓰기                  |
|=.:set sw=4           | "set si"를 했을 경우 들여쓰기 하는 깊이 설정                       |
|=.set encoding=cp949 or utf-8 | 기본 인코딩 타입을 설정                                    |


* *vimtutor를 이용학 학습* (_10/31 update_)


bq. *vimtutor* 를 이용하여 vim환경에서 vim 튜토리얼을 실행해볼 수 있다.

    "vimtutor":http://www.withover.com/2008/03/vimtutor-vi%EB%A5%BC-vi%EB%A1%9C-%EC%97%B0%EC%8A%B5%ED%95%98%EC%9E%90.html


#### vi 학습 관련 링크

* "[vi 개요](https://namu.wiki/w/vi)
* "[vi 명령어 모음](http://slayer95.tistory.com/entry/Tip%EB%A6%AC%EB%88%85%EC%8A%A4-vi%ED%8E%B8%EC%A7%91%EA%B8%B0-%EB%AA%85%EB%A0%B9%EC%96%B4-%EB%AA%A8%EC%9D%8C)
* "[vi 필수 명령어](http://www.dreamy.pe.kr/zbxe/CodeClip/148114)
* "[자주 사용하는 명령어](http://www.insford.com/wiki/Wiki.jsp?page=%EC%9E%90%EC%A3%BC%EC%93%B0%EB%8A%94%20vi%EC%97%90%EB%94%94%ED%84%B0%20%EB%AA%85%EB%A0%B9%EC%96%B4)
* "[vim 상세 정보](http://www.joinc.co.kr/w/Site/Vim/Documents/UsedVim)




p(. vi 고급 설정을 통하여 더욱 많은 기능들을 이용하는 학습을 진행합니다.

---

#### vi 고급 설정

bq. git 설치( *sudo apt-get install git* ) 후 권혁민 사원에게 파일을 요청
(추후 사용하게 될 때 설치 방법 및 설정을 update 할 예정입니다.)

p(. vim 세팅을 완료되면 아래링크의 mappings 부터 plugin들을 보고 사용해보면서 익숙해질 때 까지 학습합니다.

[vi 고급](https://github.com/bling/dotvim)

---

#### Mappings

bq. 기본적으로 <leader>키는 ','이다. 설정을 통하여 바꿀 수 있습니다.

#### insert mode

* <Ctrl - h> : 입력 모드에서 커서를 왼쪽으로 이동
* <Ctrl - l> : 입력 모드에서 커서를 오른쪽으로 이동
* jk, kj : 입력 모드에서 나온다.

#### normal mode

* <leader>fef : 파일 전체에 대한 정렬
* <leader>f$ : 현재 줄의 공백을 제거(???)
* 화면 분할
** <leader>v : 수직으로 화면을 분할
** <leader>s : 수평으로 화면을 분할
** <leader>vsa : 모든 버퍼를 수직으로 분할
** <Ctrl - h> <Ctrl - j> <Ctrl - k> <Ctrl - l> : hkjl 키로 윈도우 간 이동
* 화면 닫기
** Q : 화면을 닫고 버퍼를 삭제하기 위해서 다시 매핑(마지막 화면 버퍼 윈도우인 경우)(???)
* 검색
** <leader>fw : 커서 아래의 단어를  quickfix list에서 보여준다.
** <leader>ff : 마지막으로 검색한 단어를 quickfix list에서 보여준다. 
** / replaced with /\v : 정규식 검색
** <cr> : toggles hlsearch
* <Down> <Up> maps to :bprev and :bnext respectively
* <Left> <Right> maps to :tabprev and :tabnext respectively
* gp : 마지막으로 붙여넣기 한 범위 다시 선택
* gb : 빠른 버퍼를 이용하기 위해 보여준다
* <leader>l : 토글 list and nolist
* profiling shortcuts
** <leader>DD : 모든 함수와 파일을 profile.log으로 profiling 시작
** <leader>DP : profiling 중지
** <leader>DC : profiling을 계속 진행
** <leader>DQ : profiling을 마치고 vim을 나옴

#### visual mode

* <leader>s : 정렬 할 범위 선택
> and < : visual mode에서 선택한 범위를 자동으로 다시 선택

---

#### Plugins

#### uniate.vim

* 임의의 소스로부터 리스트를 만들 수 있게 해주는 강력한 플로그인
* mappings
** <space><space> : 파일, 버퍼, 북마크 등으로 이동할 수 있는 리스트
** <space>y : 이전 복사 선택
** <space>l : 현재 버퍼로 부터 라인을 선택
** <space>b : 현재 버퍼 선택
** <space>o : select from outline of current file
** <space>s : 빠르게 버퍼를 변경
** <space>/ : recursively search all files for matching text (uses ag or ack if found)


#### bufkill.vim

* <leader>bd or :BD  : 화면을 바꾸지 않고 버퍼를 종료


#### sneak.vim

* motion on steriods


#### easygrep

* find / set에 의존하지 않고 프로젝트에서 검색 / 바꾸기를 쉽게 사용할 수 있습니다.
* 로딩 시간은 비교적 오래 걸리기 때문에 시작할 때 로드되지 않습니다. 요청시로드하려면 <leader> vo를 사용하여 옵션 창을 엽니 다.
* <leader>vv : 커서 아래에 단어를 찾기
* <leader>vV : 커서 아래 단어 전체 찾기
* <leader>vr : perform global search replace of word under cursor, with confirmation
* <leader>vR : vr과 같지만 전체 단어를 매치시킨다.


#### unimpaired

* many additional bracket [] maps
* <Ctrl-up> : 라인을 위로 이동
* <Ctrl-down> 라인을 아래로 이동
 

#### nerdtree

* file browser
* <F2> : 토글을 검색
* <F3> : 현재 파일의 경로를 트리로 연다.


#### tcomment

* 다양한 주석 달기 모션들을 할 수 있다.
* gcc : 커서가 있는 행 주석 달기
* gc{motion} : gc 다음 움직임에 따라 주석 달기


#### ctrlp

* fuzzy file searching
* <C-p> to bring up the search
* \t search the current buffer tags
* \T search global tags
* \l search all lines of all buffers
* \b search open buffers
* \o parses the current file for functions with funky


#### nrrwrgn

* <leader>nr : 현재의 visual 선택을 새로운 스크래치 버퍼에 저장하여 전역 명령을 수행하고 변경 사항을 원본 파일에 자동으로 병합 할 수 있도록 한다.


#### tabular

* easily aligns code
* <leader>a&, <leader>a=, <leader>a:, <leader>a,, <leader>a|


#### emmet

* makes for writing html/css extremely fast
* for supported most filetypes, <tab> will be mapped to automatically expand the line (you can use <C-v><Tab> to insert a tab character if needed)
* for other features, default plugin mappings are available, which means <C-y> is the prefix, followed by a variety of options (see :help zencoding)


#### undotree

* undo tree를 보여준다
* <F5> to toggle


#### youcompleteme/ultisnips

* 빠른 퍼지 자동 완성 엔진과 뛰어난 발췌 문장 라이브러리
* <Ctrl-n> 와 <Ctrl-p>를 사용하여 위아래로 이동할 수 있고, <tab>으로 선택할 수 있습니다.


#### neocomplcache/neosnippet

* YCM 또는 python을 사용할 수 없을 때 대체옵션으로 autocomplete/snippet을 지원
* <Tab> 키를 사용하여 다음 일치 항목을 선택하거나 키워드가 snippet 인 경우 확장하십시오.
* lua를 설치했다면, neocoplete로 대신 사용


#### vimshell

* <leader>c : splits a new window with an embedded shell embedded shell로 새 창을 나눈다.


#### vim-multiple-cursors

* :<Ctrl-N> : 원하는 단어를 visual mode 에서 블락을 선택한 뒤 단어를 <Ctrl-n>로 선택하고 동시에 모든 일치 항목을 동시에 변경할 수 있습니다.

---



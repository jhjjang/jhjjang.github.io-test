 **tcpdump와 tcpflow**

* 패킷캡처프로그램

* 명령줄에서 실행하는 일반적인 +패킷 가로채기+ 소프트웨어
** 패킷 가로채기 : 스니핑(snipping)이라고도 하며, 네트워크 통신 내용을 도청하는 행위. 이때 사용되는 도구를 패킷분석기 또는 패킷 스니퍼라고 하며,
네트워크의 일부나 디지털 네트워크를 통하는 트래픽의 내용을 저장하거나 가로채는 기능을 하는 소프트웨어 또는 하드웨어이다.
프로토콜 분석기라고도 불리며, 그 예로는 Fiddler, wireShark, tcpdump등이 있다.

---

**tcpdump**

bq. 컴퓨터에 부착된 네트워크를 통해 송수신되는 기타 패킷을 가로채고 표시할 수 있게 도와준다.
대부분의 유닉스 계열 운영 체제(ex)리눅스)에서 동작하며 여기서 +libpcap+ 라이브러리를 사용하여 패킷을 포획한다.
* pcap(packet capture) : 네트워크 트래픽 포착용API를 구성하고 있으며, 유닉스 계열 운영체제들은 libpcap 라이브러리에 pcap을 포함한다. 윈도우에서는 WinPcap이라는 libcap 포팅을 이용한다.

* [tcpdump 개념](https://ko.wikipedia.org/wiki/Tcpdump)
* [tcpdump 실행예시](https://zetawiki.com/wiki/%EB%A6%AC%EB%88%85%EC%8A%A4_tcpdump)

---

 **tcpflow**

bq. tcpflow는 TCP연결의 일부로 전송된 데이터를 캡처하고 프로토콜 분석 또는 디버깅에 편리한 방식으로 데이터를 저장하는 프로그램

* tcpflow는 실제 데이터 스트림을 재구성하고 나중에 분석할 수 있도록 각 플로우를 별도의 파일에 저장한다.
** tcpdump와 같은 프로그램은 연결된 패킷의 요약을 보여주지만, 실제로 전송되는 데이터는 저장하지 않는다.
* 일반적인 TCP 흐름은 각 방향에 대해 하나씩 두개의 파일에 저장이 된다. 또한, tcpflow는 저장된 tcpdump 패킷 흐름을 처리할 수 있다.
* tcpflow는 TCP 시퀀스 번호를 인식하고 재전송이나 순서가 잘못된 전달과 관계없이 데이터 스트림을 올바르게 재구성한다.
* tcpdump나 WireShark와 달리 tcpflow는 한번에 수천 또는 수백만의 TCP 연결을 재구성하고 일반 파일을 저장하므로 데이터를 쉽게 분석할 수 있다.

* [tcpflow 개념](http://manpages.ubuntu.com/manpages/artful/man1/tcpflow.1.html)
* [tcpflow 실행예시](https://coderwall.com/p/58uhmg/watch-http-requests-on-any-port-with-tcpflow)
---

bq. tcpdump, tcpflow 모두 패킷캡처프로그램이지만, tcpdump는 패킷의 요약을 보여주고 tcpflow는 요청과 응답에 대한 실제 데이터를 캡처

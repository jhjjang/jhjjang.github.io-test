```
cd /react_native_workspace
1.프로젝트 만들기 
npx react-native init MyApp3
2.경로이동
cd MyApp3 
3.실행 - 에뮬레이터가 늦게 켜질경우(nexus 6도 잘돌아감) 
npx react-native run-android 

Invalid Varient 어플리케이션 등록 안되었다고 뜰때 처리방법 
콘솔창을 다 닫기 (Metro server 가 돌아가면서 - web server)
자기 프로젝트 폴더에서 콘솔창 다 닫고 본인 폴더 가서 다시 
npx react-native run-android 하면 Metro 서버가 다시 시작된다 

디버깅 방법 : 에뮬레이터 ctrl-m  팝업창 열리면 debug 선택 
크롬브라우저로 디버깅 가능한다 

http://localhost:8081/debugger-ui/

프로그램 내에서 console.log(메시지)
F12 버튼 누르면 콘솔탭 누르기 

리액트 
부모컴포넌트 -> 자식컴포넌트 : props 를 통해서 
              생성자에서 꼭 전달을 해줘야 한다 

컴포넌트 자체에 대한 변수들, 상태값들은 state 객체를 통해서만 
저장은 state 에 json 객체 형태로 저장하고 
값 변경시는 state객체의 setState 함수를 호출하여 값을 바꾸어야 한다 
setState 함수의 전달인자도 json 형태이다
예)
this.state={'키1':'값1', '키2':'값2', '키3':'값3'...}
this.setState({'키1':'값1'})  한개씩 해도 되고 여러개도 된다 
this.setState({'키1':'값1', '키2':'값2', '키3':'값3'}) 

값읽을때  this.state.키1 , this.state.키2 ....

리액트 : 컴포넌트간에 정보 전달 방식때문에 아주 복잡, redux 라이브러리 
redux 라이브러리, 스토어를 만들어서 컴포넌트가 공통으로 사용하게 상태관리를 해주는 라이브러리 

nodejs - 비동기를 지원 함수를 - 직접 호출 못하고 간접호출

리액트-네이티브 : react-navigation 이걸 사용하면 컴포넌트간에 정보 전달
props에 정보 전달이 가능하다 

react-navigation - 화면전환에 사용되는 라이브러리 

App.js
/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow
 */

import React from 'react';
import {
  SafeAreaView,
  StyleSheet,
  ScrollView,
  View,
  Text,
  StatusBar,
} from 'react-native';

import {
  Header,
  LearnMoreLinks,
  Colors,
  DebugInstructions,
  ReloadInstructions,
} from 'react-native/Libraries/NewAppScreen';

class App extends React.Component{
  //생성자 만들어서 
  constructor(props){
    super(props)
    console.log("객체가 생성되었음")
  }

  render(){
    return (
      <View>
        <Text>This is my second android app</Text>
      </View>
    )
  }
};

const styles = StyleSheet.create({
  scrollView: {
    backgroundColor: Colors.lighter,
  },
  engine: {
    position: 'absolute',
    right: 0,
  },
  body: {
    backgroundColor: Colors.white,
  },
  sectionContainer: {
    marginTop: 32,
    paddingHorizontal: 24,
  },
  sectionTitle: {
    fontSize: 24,
    fontWeight: '600',
    color: Colors.black,
  },
  sectionDescription: {
    marginTop: 8,
    fontSize: 18,
    fontWeight: '400',
    color: Colors.dark,
  },
  highlight: {
    fontWeight: '700',
  },
  footer: {
    color: Colors.dark,
    fontSize: 12,
    fontWeight: '600',
    padding: 4,
    paddingRight: 12,
    textAlign: 'right',
  },
});

export default App;


```









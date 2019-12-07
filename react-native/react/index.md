```
https://facebook.github.io/react-native/docs/getting-started
https://g6ling.gitbooks.io/react-native-tutorial-korean/1-1ko.html

/*
설치하기
npm install -g expo-cli

expo init MyApp
minimal 선택
프로젝트명 : myapp
설명 : This is first react native app 
yarn 으로 설치 

cd MyApp
npm start # you can also use: expo start
*/



1.안드로이드 설치

2. sdk - 상세보이기 선택후 28설치할것 
Android SDK Platform 28
Intel x86 Atom_64 System Image or Google APIs Intel x86 Atom System Image

3. 안드로이드 홈 지정하기 
Configure the ANDROID_HOME environment variable

4.환경변수 추가
ANDROID_HOME
ANDROID_SDK_ROOT
C:\Users\user\AppData\Local\Android\Sdk

Add platform-tools to Path
C:\Users\user\AppData\Local\Android\Sdk\platform-tools
%ANDROID_HOME%\platform-tools

npx react-native init AwesomeProject

AVD
Nexus 5X  설치

npm install -g react-native-cli

npx react-native init AwesomeProject
npx react-native init AwesomeProject --version X.XX.X
npx react-native init AwesomeTSProject --template react-native-template-typescript  # 템플릿포함 


npx react-native init MyApp1
cd /react_native/MyApp1
npx react-native run-android


alignContent 는 교차 축을 따라 선의 분포를 정의합니다. 항목을 사용하여 여러 줄로 줄 바꿈 한 경우에만 효과가 있습니다 flexWrap.

flex-start( 기본값 ) 줄 바꿈 된 선을 컨테이너의 가로축 시작 부분에 맞 춥니 다.

flex-end 래핑 된 선을 컨테이너의 횡축 끝에 맞 춥니 다.

stretch 컨테이너의 가로축 높이와 일치하도록 줄 바꿈.

center 포장 된 선을 용기의 가로 축 가운데에 맞 춥니 다.

space-between 컨테이너의 기본 축에 걸쳐 줄을 균등하게 배치하여 줄 사이에 남은 공간을 분산시킵니다.

space-around컨테이너의 주축에 걸쳐 줄을 균등하게 배치하여 줄 주위에 남은 공간을 분배합니다.



화면간이동
npm install --save react-navigation

npx는 자바스크립트 패키지 관리 모듈인 npm(Node Package Module)의 npm@5.2.0 버전부터 새로 추가된 도구이다. 
따라서 npm@5.2.0 이상 버전만 깔려 있다면 npx 커맨드를 사용 가능합니다.



npx react-native init MyApp3
cd /react_native/MyApp3
npx react-native run-android


npm install --save react-navigation react-native-gesture-handler react-native-reanimated react-native-screens
npm install --save react-navigation-stack
npm install --save react-navigation-drawer
npm install --save native-base 
npm install --save react-navigation-tabs
npm install 
npm audit fix


자꾸 오류남 - unable  어쩌고

mkdir android/app/src/main/assets
react-native bundle --platform android --dev false --entry-file index.js 
--bundle-output android/app/src/main/assets/index.android.bundle --assets-dest android/app/src/main/res



index.js 
/**
 * @format
 */

import {AppRegistry} from 'react-native';
//import App from './App';
import MainScreen from './components/MainScreen';
import {name as appName} from './app.json';

//AppRegistry.registerComponent(appName, () => App);
AppRegistry.registerComponent(appName, () => MainScreen);


./components/MainScreen.js
import React, { Component } from 'react';
import { StyleSheet, Text, View } from 'react-native';
import { Icon } from 'native-base'; // 추가된 코드
import { createBottomTabNavigator } from 'react-navigation-tabs'; 
import { createAppContainer } from 'react-navigation'; 

import HomeTab from './HomeTab'
import SearchTab from './SearchTab'
import AddMediaTab from './AddMediaTab'
import LikesTab from './LikesTab'
import ProfileTab from './ProfileTab'

// 하단 탭 네비게이터 생성
const AppTabNavigator = createBottomTabNavigator({
    HomeTab: { screen: HomeTab },
    SearchTab: { screen: SearchTab },
    AddMediaTab: { screen: AddMediaTab },
    LikesTab: { screen: LikesTab },
    ProfileTab: { screen: ProfileTab }
  });
  
const AppTabContainet = createAppContainer(AppTabNavigator);

export default class MainScreen extends Component {

  // navigationOptions 코드 추가
  static navigationOptions = {
    headerLeft: <Icon name='ios-camera' style={{ paddingLeft:10 }}/>,
    title: 'Instagram',
    headerRight: <Icon name='ios-send' style={{ paddingRight:10 }}/>,
  }

  render() {
    /*return (
      <View style={styles.container}>
        <Text>MainScreen</Text>
      </View>
    );*/
    return (<AppTabContainet/>);
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
});
```




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









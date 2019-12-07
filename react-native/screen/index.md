```
화면전환1 - Navigation 설치하기 
npm install -g react-native-cli

npx react-native init Hello
cd /react_native/Hello

npm install --save react-navigation
npm install --save react-native-gesture-handler
npm install --save react-native-reanimated
npm install --save react-native-screens
npm install --save react-navigation-stack
npm install --save native-base 
npm install --save react-base
npm audit 

npx react-native run-android


에러메시지 다음처럼 뜨면 
Unable to load script.Make sure you are either running a Metro server or that your bundle 'index.android.bundle' is packaged correctly for release

mkdir android/app/src/main/  폴더아래애 assets 만들고 다음 명령어 실행하기 
react-native bundle --platform android --dev false --entry-file index.js --bundle-output android/app/src/main/assets/index.android.bundle --assets-dest android/app/src/main/res

android 패키지가 -> andoridx 패키지로 전환됨 
npm install -g react-native 는 이를 인식 못함 그래서 실행할때 꼭 
npx react-native run-android 로 하자 



App.js 수정하기 

import React from 'react';
import { View, Text, Button } from 'react-native';
import { createAppContainer } from 'react-navigation';
import { createStackNavigator } from 'react-navigation-stack';

//1.메인 페이지를 만든다 
class HomeScreen extends React.Component {
  render() {
    return (
      <View style={{ flex: 1, alignItems: 'center', justifyContent: 'center' }}>
        <Text>This my Home</Text>

        <Button
            title = 'Go detail screen'
            onPress = {()=>this.props.navigation.navigate('Details')}/>

      </View>
    );
  }
}


class DetailsScreen extends React.Component {
  render() {
      return (
        <View style={{ flex: 1, alignItems: 'center', justifyContent: 'center' }}>
          <Text>Seonoh Detail Screen</Text>
          <Button
          title = 'Go Home screen'
          onPress = {()=>this.props.navigation.navigate('Home')}/>
        </View>
      );
    }
  }
  

//2. AppNavigagor  객체를 등록한다 
const AppNavigator = createStackNavigator(
  {
      Home: HomeScreen,
      Details: DetailsScreen
  },
  {
    initialRouteName: 'Home',
  }
);
export default createAppContainer(AppNavigator);



화면전환2

npx react-native init Hello2
cd /react_native/Hello2

npm install --save react-navigation
npm install --save react-native-gesture-handler
npm install --save react-native-reanimated
npm install --save react-native-screens
npm install --save react-navigation-stack
npm install --save native-base 
npm install --save react-base

metro 서버를 끈다 
npx react-native run-android


import React from 'react';
import { View, Text, Button } from 'react-native';
import { createAppContainer } from 'react-navigation';
import { createStackNavigator } from 'react-navigation-stack';

//1.메인 페이지를 만든다 
class HomeScreen extends React.Component {
    constructor(props)
    {
      super(props)
        //값 전달하기 
      state= { 
        isLoaded : false, // 화면이 전환될 여부 
        name:"홍길동",
        age:"23"
      }
    
    }
  
    //모든 랜더링이 종료한 후에 
    componentDidMount()
    {
        
    }
  
   render() {
    const {navigation}  = this.props;
    const msg = navigation.getParam("msg", '값을 주고 받아봅시다');

    return (
      <View style={{ flex: 1, alignItems: 'center', justifyContent: 'center' }}>
        <Text>This my Home  {msg}</Text>

        <Button
            title = 'Go detail screen'
            onPress = {()=>this.props.navigation.navigate('Details', 
              {name:"홍길동", age:"24"})}/>
      </View>
    );
  }
}

class DetailsScreen extends React.Component {
  
  render() {

    const {navigation}  = this.props;
    const name = navigation.getParam('name', '임꺽정');
    const age = navigation.getParam('age', '43');

      return (
        <View style={{ flex: 1, alignItems: 'center', justifyContent: 'center' }}>
          <Text>Seonoh Detail Screen {name} *** {age} </Text>
          <Button
          title = 'Go Home screen'
          onPress = {()=>this.props.navigation.navigate('Home', {msg:"안녕하세요"})}/>
        </View>
      );
    }
  }
  

//2. AppNavigagor  객체를 등록한다 
const AppNavigator = createStackNavigator(
  {
      Home: HomeScreen,
      Details: DetailsScreen
  },
  {
    initialRouteName: 'Home',
  }
);
export default createAppContainer(AppNavigator);



디버커 : 에뮬레이터에서 CTRL-M 을 누른다 크롬브라우저에서 디버깅 가능하다 

App2.js
import React from 'react';
import { View, Text, Button } from 'react-native';
import { createAppContainer } from 'react-navigation';
import { createStackNavigator } from 'react-navigation-stack';

//1.메인 페이지를 만든다 
class HomeScreen extends React.Component {
    constructor(props)
    {
      super(props)
        //값 전달하기 
      state= { 
        isLoaded : false, // 화면이 전환될 여부 
        name:"홍길동",
        age:"23"
      }
    
    }
  
    //모든 랜더링이 종료한 후에 
    componentDidMount()
    {
        
    }
  
   render() {
    const {navigation}  = this.props;
    const msg = navigation.getParam("msg", '값을 주고 받아봅시다');

    return (
      <View style={{ flex: 1, alignItems: 'center', justifyContent: 'center' }}>
        <Text>This my Home  {msg}</Text>

        <Button
            title = 'Go detail screen'
            onPress = {()=>this.props.navigation.navigate('Details', 
              {name:"홍길동", age:"24"})}/>
      </View>
    );
  }
}

class DetailsScreen extends React.Component {
  
  render() {

    const {navigation}  = this.props;
    const name = navigation.getParam('name', '임꺽정');
    const age = navigation.getParam('age', '43');

      return (
        <View style={{ flex: 1, alignItems: 'center', justifyContent: 'center' }}>
          <Text>Seonoh Detail Screen {name} *** {age} </Text>
          <Button
          title = 'Go Home screen'
          onPress = {()=>this.props.navigation.navigate('Home', {msg:"안녕하세요"})}/>
        </View>
      );
    }
  }
  

//2. AppNavigagor  객체를 등록한다 
const AppNavigator = createStackNavigator(
  {
      Home: HomeScreen,
      Details: DetailsScreen
  },
  {
    initialRouteName: 'Home',
  }
);
export default createAppContainer(AppNavigator);


App3.js
import React from 'react';
import { View, Text, Button, FlatList, ActivityIndicator} from 'react-native';
import { createAppContainer } from 'react-navigation';
import { createStackNavigator } from 'react-navigation-stack';

//1.메인 페이지를 만든다 
class HomeScreen extends React.Component {
    constructor(props)
    {
      super(props)
        //값 전달하기 
      this.state= { 
        isLoaded : false, // 화면이 전환될 여부 
        dataSource:Object
      }
    
    }
  
    //모든 랜더링이 종료한 후에 
    componentDidMount()
    {
        console.log("*******************************");
        fetch('https://facebook.github.io/react-native/movies.json')
        .then((response) => response.json())
        .then((responseJson) => {
            this.setState({
                isLoaded: true,
                dataSource: responseJson.movies,
            }, 
            function(){
                console.log(responseJson.movies)
            });
            console.log("@@@@@@@@@@");
        })
        .catch((error) =>{
          console.log("333333333333333");
          console.log(error);
        });
    }



  render() {
   
    return (
      <View style={{ flex: 1, alignItems: 'center', justifyContent: 'center' }}>
        <Text>This my Home</Text>
   
 
        <Button
            title = 'Go detail screen'
            onPress = {()=>this.props.navigation.navigate('Details',
              {dataSource:this.state.dataSource})}/>
       
       {
          this.state.isLoaded?(
          <FlatList
              data={this.state.dataSource}
              renderItem={({item}) => <Text>{item.title}, {item.releaseYear}</Text>}
              keyExtractor={({id}, index) => id}
              />
          ):(<ActivityIndicator/>)
        }

      </View>
    );
  }
}


class DetailsScreen extends React.Component {
 
  render() {
    const {navigation}  = this.props;
    const dataSource = navigation.getParam("dataSource");

      return (
        <View style={{ flex: 1, alignItems: 'center', justifyContent: 'center' }}>
          <Text>Seonoh Detail Screen</Text>
          <Button
          title = 'Go Home screen'
          onPress = {()=>this.props.navigation.navigate('Home')}/>
   
           <FlatList
            data={dataSource}
            renderItem={({item}) => <Text>{item.title}, {item.releaseYear}</Text>}
            keyExtractor={({id}, index) => id}
            />

        </View>
      );
    }
  }
  

//2. AppNavigagor  객체를 등록한다 
const AppNavigator = createStackNavigator(
  {
      Home: HomeScreen,
      Details: DetailsScreen
  },
  {
    initialRouteName: 'Home',
  }
);
export default createAppContainer(AppNavigator);


Crud.js
import React from 'react';
import { View, Text, Button, FlatList, ActivityIndicator} from 'react-native';
import { createAppContainer } from 'react-navigation';
import { createStackNavigator } from 'react-navigation-stack';

//1.메인 페이지를 만든다 
class HomeScreen extends React.Component {
    constructor(props)
    {
      super(props)
        //값 전달하기 
      this.state= { 
        isLoaded : false, // 화면이 전환될 여부 
        dataSource:Object
      }
    
    }
  
    //모든 랜더링이 종료한 후에 
    componentDidMount()
    {
        //"http://10.0.2.2:8080"
        //adb reverse tcp:8082 tcp:8082

        /*
        <uses-permission android:name="android.permission.INTERNET" />
<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
*/
        fetch('http://10.0.2.2:8082/rest/board/list',{
            method: 'GET',
            headers: {
              Accept: 'application/json',
              'Content-Type':'application/json',
            }
          })

        .then((response) => response.json())
        .then((responseJson) => {
            
            this.setState({
                isLoaded: true,
                dataSource: responseJson,
            }, 
            function(){
                console.log("complete")
            });
            
        })
        .catch((error) =>{
         
          console.log("error : ", error);
        });
    }



  render() {
   
    return (
      <View style={{ flex: 1, alignItems: 'center', justifyContent: 'center' }}>
        <Text>This my Home</Text>
   
 
        <Button
            title = 'Go detail screen'
            onPress = {()=>this.props.navigation.navigate('Details',
              {dataSource:this.state.dataSource})}/>
       
       {
          this.state.isLoaded?(
          <FlatList
              data={this.state.dataSource}
              renderItem={({item}) => <Text>{item.title} {item.contents}</Text>}
              keyExtractor={({id}, index) => id}
              />
          ):(<ActivityIndicator/>)
        }

      </View>
    );
  }
}


class DetailsScreen extends React.Component {
 
  render() {
    const {navigation}  = this.props;
    const dataSource = navigation.getParam("dataSource");

      return (
        <View style={{ flex: 1, alignItems: 'center', justifyContent: 'center' }}>
          <Text>Seonoh Detail Screen</Text>
          <Button
          title = 'Go Home screen'
          onPress = {()=>this.props.navigation.navigate('Home')}/>
   
           <FlatList
            data={dataSource}
            renderItem={({item}) => <Text>{item.title} {item.contents}</Text>}
            keyExtractor={({id}, index) => id}
            />

        </View>
      );
    }
  }
  

//2. AppNavigagor  객체를 등록한다 
const AppNavigator = createStackNavigator(
  {
      Home: HomeScreen,
      Details: DetailsScreen
  },
  {
    initialRouteName: 'Home',
  }
);
export default createAppContainer(AppNavigator);

```

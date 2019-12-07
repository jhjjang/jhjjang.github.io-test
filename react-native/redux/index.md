
1. [참조1](https://busy.org/@anpigon/react-native-redux-counter--1547278235048)
2. [참조2](https://velog.io/@velopert/Redux-1-%EC%86%8C%EA%B0%9C-%EB%B0%8F-%EA%B0%9C%EB%85%90%EC%A0%95%EB%A6%AC-zxjlta8ywt)

```
리덕스는, 가장 사용률이 높은 상태관리 라이브러리입니다.
리덕스를 사용하면, 여러분이 만들게 될 컴포넌트들의 상태 관련 로직들을 다른 파일들로 분리시켜서 더욱 효율적으로 관리 할 수 있습니다.
컴포넌트끼리 상태를 공유하게 될 때 여러 컴포넌트를 거치지 않고도 손쉽게 상태 값을 전달 할 수 있습니다.

용어정리 

액션 (Action)
상태에 어떠한 변화가 필요하게 될 땐, 액션이란 것을 발생시킨다
액션 객체는 type 필드를 필수적으로 가지고 있어야하고 그 외의 값들은 개발자 마음대로 넣어줄 수 있습니다

액션 생성함수 (Action Creator)
액션 생성함수는, 액션을 만드는 함수입니다. 단순히 파라미터를 받아와서 액션 객체 형태로 만든다

리듀서 (Reducer)
리듀서는 변화를 일으키는 함수입니다. 리듀서는 두가지의 파라미터를 받아옵니다.

function reducer(state, action) {
  // 상태 업데이트 로직
  return alteredState;
}
리듀서는, 현재의 상태와, 전달 받은 액션을 참고하여 새로운 상태를 만들어서 반환합니다. 자세한건, 추후 직접 구현하면서 알아보겠습니다.


스토어 (Store)
리덕스에서는 한 애플리케이션 단 하나의 스토어를 만들게 됩니다.단
스토어 안에는, 현재의 앱 상태와, 리듀서가 들어가있고, 추가적으로 몇가지 내장 함수들이 있습니다.

디스패치 (dispatch)
디스패치는 스토어의 내장함수 중 하나입니다. 디스패치는, 액션을 발생 시키는 것 이라고 이해하시면 됩니다.
dispatch 라는 함수에는 액션을 파라미터로 전달합니다.. dispatch(action) 이런식으로 말이죠.

그렇게 호출을 하면, 스토어는 리듀서 함수를 실행시켜서 해당 액션을 처리하는 로직이 있다면 액션을 참고하여 새로운 상태를 만들어줍니다.

구독 (subscribe)
구독 또한 스토어의 내장함수 중 하나입니다. 
subscribe 함수는, 함수 형태의 값을 파라미터로 받아옵니다. subscribe 함수에 특정 함수를 전달해주면, 
액션이 디스패치 되었을 때 마다 전달해준 함수가 호출됩니다.


프로젝트의 루트에 세 개의 폴더 reducers, components 를 생성한다.

Redux Reducers 구현
Reducers는 앱에서 필요한 데이터를 반환한다. 여기서는 Counter 값을 반환하는 reducer가 필요하다. 
reducers 폴더에 countReducer.js 파일을 생성한다.

다음과 같이 하나의 js 파일에 액션과 리듀서를 모두 구현하는 것을 Ducks 구조이라고 한다.
Ducks 구조를 사용하면 나중에 코드 관리하기가 편하다.

npx react-native init ReduxDemo
cd ReduxDemo

npm install redux react-redux --save
npm install native-base --save
npm install @expo/vector-icons --save

파일명 : reducers/countReducer.js
//서로 공유하고자 하는 정보값, 초기상태  
const initialState = {
    count: 0
};

// Actions:액션을 상수로 정의 한다. 여기서는 Increment 라는 액션과 Decrement라는 액션을 만든다 
export const INCREMENT = "Increment";
export const DECREMENT = "Decrement";

//액션 함수들 
export function increment(){
  return {
    type: INCREMENT
  };
}
export function decrement(){
  return {
    type: DECREMENT
  };
}

// Reducer :현재의 상태와, 전달 받은 액션을 참고하여 새로운 상태를 만들어서 반환
function reducer(state = initialState, action) {
  switch (action.type) {
    case INCREMENT:   //액션이 INCREMENT 일때 처리할 상황, state 를 수정한다 
      return {
        count: state.count + 1
      }
    case DECREMENT:   //액션이 DECREMENT 일때 처리할 상황, state 를 수정한다 
      return {
        count: state.count - 1
      }
  }
  return state;
}

// Exports Default
export default reducer; //리듀서 export


파일명 : reducers/index.js -- 모든 reducer 를 결합한다 
import { combineReducers } from 'redux';
import countReducer from './countReducer.js';

const allReducers = combineReducers({
  countReducer,
});

export default allReducers;



파일명 : components/Counter.js  - 컴포넌트 
import React, { Component } from 'react';
import { connect } from 'react-redux';
import { bindActionCreators } from 'redux';
import { Container, Content, Text, Card, Header, Body, Button, Title, CardItem } from 'native-base';
import { increment, decrement } from '../reducers/countReducer';

class Counter extends Component {
    render() {
    return(
      <Container>
        <Header>
          <Body>
            <Title>Redux Counter</Title>
          </Body>
        </Header>
        <Content padder>
          <Card>
            <CardItem>
              <Text>
                { this.props.state.count }
              </Text>
            </CardItem>
          </Card>
          <Button full onPress= {() => this.props.increment()} style={{marginVertical: 10}}>
            <Text>Increment</Text>
          </Button>
          <Button full dark bordered onPress= {() => this.props.decrement()}>
            <Text>Decrement</Text>
          </Button>
        </Content>
      </Container>
    );
  }
}

// Reducer 데이터를 props로 변환
function mapStateToProps(state){
  return {
    state: state.countReducer
  };
}

// Actions을 props로 변환
function matchDispatchToProps(dispatch){
  return bindActionCreators({
    increment: increment,
    decrement: decrement
  }, dispatch);
}

export default connect(mapStateToProps, matchDispatchToProps)(Counter);


App.js
import React, { Component } from 'react';
import { Provider } from 'react-redux';
import { createStore } from 'redux';
import allReducers from './reducers';
import Counter from './components/counter.js';

//스토어를 만든다 
const store = createStore(allReducers);

export default class App extends Component{
  render(){
    return(
      <Provider store={store}>
        <Counter />
      </Provider>
    );
  }
}
```

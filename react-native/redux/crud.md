1. [참조1](https://codeburst.io/redux-a-crud-example-abb834d763c9)
1. [참조2](https://appdividend.com/2018/06/15/react-redux-axios-tutorial-example/)

```
npm install -g create-react-app

1. 프로젝트 만들기
create-react-app crud-redux

cd crud-redux/src 
리눅스 : rm App.css App.test.js logo.svg registerServiceWorker.js
윈도우 : del App.css App.test.js logo.svg registerServiceWorker.js

npm install --save redux react-redux

또는 

yarn add redux
yarn add react-redux

리덕스 - 상태관리 라이브러리(반드시 리액트일 필요 없이 앵귤러도 가능하다)


파일명 : crud-redux/src/index.js

import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
import App from './App';


ReactDOM.render(
<App />,document.getElementById('root'));

파일명 : crud-redux/src/App.js
import React, { Component } from 'react';

class App extends Component {
  render() {
      return (
      <div className="App">
        <h1>Hello React!</h1>
      </div>
      );
  }
}
export default App;

파일추가 
파일명 : crud-redux/src/PostForm.js
import React, { Component } from 'react';

class PostForm extends Component {
	render() {
		return (
		<div>
			<h1>Create Post</h1>
			<form>
			 <input required type="text" placeholder="Enter Post Title" /><br /><br />
			 <textarea required rows="5" cols="28" placeholder="Enter Post" /><br /><br />
			 <button>Post</button>
			</form>
		</div>
		);
	}
}
export default PostForm;

파일명 : crud-redux/src/AllPost.js
import React, { Component } from 'react';

class AllPost extends Component {
  render() {
    return (
    <div>
      <h1>All Posts</h1>
    </div>
    );
   }
}

export default AllPost;


파일수정 :  crud-redux/src/App.js


import React, { Component } from 'react';
import PostForm from './PostForm';
import AllPost from './AllPost';

class App extends Component {
  render() {
    return (
    <div className="App">
        <PostForm />
        <AllPost />
    </div>
    );
    }
  }
export default App;

파일추가 : /src/reducers/postReducers
//postReducer.js
const postReducer = (state = [], action) => {

}


export default postReducer;

파일 수정 : src/index.js
import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
import App from './App';

//ReactDOM.render(<App />,document.getElementById('root'));

import { createStore } from 'redux';
import { Provider } from 'react-redux';

import postReducer from './reducers/postReducer';
const store = createStore(postReducer);
ReactDOM.render(
    <Provider store={store}>
        <App />
    </Provider>, document.getElementById('root')
);


파일수정:PostForm.js
import React, { Component } from 'react';

class PostForm extends Component {

    //함수 추가하기 
    handleSubmit = (e) => {
        //본래 기능 막고 
        e.preventDefault();
        const title = this.getTitle.value;
        const message =  this.getMessage.value;
        const data = {
            id: new Date(),
            title,
            message
        }

				console.log(data)
    }
    render() {
        return (
            <div>
                <h1>Create Post</h1>
                    <form onSubmit={this.handleSubmit}>
                        <input required type="text" ref={(input)=>this.getTitle = input} 
                            placeholder="Enter Post Title"/>
                        <br /><br />
                        <textarea required rows="5" ref={(input)=>this.getMessage = input} cols="28" 
                            placeholder="Enter Post" />
                        <br /><br />
                        <button>Post</button>
                    </form>
            </div>
        );
    }
}
export default PostForm;



파일추가 : post.js
import React, { Component } from 'react';

class Post extends Component {
  render() {
  return (
    <div>
      <h2>{this.props.post.title}</h2>
      <p>{this.props.post.message}</p>
    </div>
  );
 }
}
export default Post;


파일수정 : /reducers/postReducer.js
//postReducer.js
/*const postReducer = (state = [], action) => {

}
export default postReducer;
*/

const postReducer = (state = [], action) => {
    switch(action.type) {
      case 'ADD_POST':
        return state.concat([action.data]);
      case 'DELETE_POST':
        return state.filter((post)=>post.id !== action.id);
      default:
        return state;
    }
}
export default postReducer;


파일수정 : AllForm.js
import React, { Component } from 'react';

import { connect } from 'react-redux';
import Post from './post';

class AllPost extends Component {
    render() {
        return (
            <div>
                <h1>All Posts</h1>
                {this.props.posts.map((post) => <Post key={post.id} post={post} />)}
                {console.log(this.props.posts)}
            </div>
        );
    }
}

const mapStateToProps = (state) => {
    return {
        posts: state
    }
}
export default connect(mapStateToProps)(AllPost);


//파일수정 : post.js
import React, { Component } from 'react';

class Post extends Component {
  render() {
  return (
    <div>
      <h2>{this.props.post.title}</h2>
      <p>{this.props.post.message}</p>
      <button>Edit</button>
      <button>Delete</button>
    </div>
  );
 }
}
export default Post;


최종소스
filename : index.css
body {
    margin: 0;
    padding: 0;
    font-family: 'Work Sans',sans-serif;
    background:#f4f4ef;
}


.center {
    text-align: center;
}
a {
    color:#636363;
    text-decoration: none;
    transition:all 0.5s ease-in;
}


a:hover {
    text-decoration: underline;
}


/* Navigation */


.navbar {
    background:#fff;
    text-align:center;
    padding:1.5rem 0;
    width:100%;
    display:flex;
    justify-content: center;
    align-items: center;
    box-shadow:0 5px 15px 0 rgba(46, 61, 73, 0.12);
}


.navbar h2 {
    margin:0;
    font-weight:200;
    font-size:30px;
    letter-spacing: 4px;
    font-family:'Work Sans',sans-serif;
}


/* Post Styles */
.post-container {
    background:#fff;
    padding:50px;
    width:50%;
    margin:40px auto;
    box-shadow:0 5px 15px 0 rgba(46, 61, 73, 0.12);
    font-family:'Work Sans',sans-serif;
}


.post_heading {
    text-align:center;
    font-weight:400;
    font-size:40px;
    color:#636363;
}


.form {
    display:flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
}


.form input {
    height:44px;
    padding-left:15px;
    padding-right:15px;
    border: 1px solid #dbe2e8;
    font-size:14px;
    border-radius:2px;
    color:#636363;
    box-shadow: 0 2px 2px 0 rgba(46, 60, 73, 0.05);
    outline:none;
    width:80%;
}


.form textarea {
    width:80%;
    max-width:80%;
    padding-left:15px;
    padding-right:15px;
    padding-top:15px;
    border: 1px solid #dbe2e8;
    font-size:14px;
    border-radius:2px;
    color:#636363;
    font-family: 'Work Sans,',sans-serif;
    box-shadow: 0 2px 2px 0 rgba(46, 60, 73, 0.05);
    outline:none;
}


/* All Posts */


.all_post_heading {
    text-align:center;
    font-weight:400;
    font-size:40px;
    color:#636363;
    word-wrap: break-word;
}


.post {
    background:#fff;
    width:60%;
    margin:0 auto;
    padding:30px;
    margin-bottom:20px;
    box-shadow: 10px 10px 12px 0 rgba(46, 60, 73, 0.05);
}


.form button {
    background:#02b3e4;
    padding:15px 40px;
    text-align: center;
    color:#fff;
    font-family:'Work Sans',sans-serif;
    border-radius:4px;
    border:none;
    font-size:20px;
}


.post_title {
    text-align:center;
    font-weight:400;
    font-size:40px;
    color:#636363;
    word-wrap: break-word;
}


.post_message {
    font-size:25px;
    font-weight: 200;
    line-height: 2.5rem;
    text-align:center;
    word-wrap: break-word
}


.control-buttons {
    display:flex;
}


.delete {
    background: #ff7777;
    border:none;
    text-align: center;
    font-size:20px;
    padding:10px 25px;
    border-radius:20px;
    cursor:pointer;
    outline: none;
    color:#fff;
}


.edit {
    background:#02b3e4;;
    border:none;
    text-align: center;
    font-size:20px;
    padding:10px 25px;
    border-radius:20px;
    cursor:pointer;
    margin-right:auto;
    outline: none;
    color:#fff;
}

파일명 : index.js
import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
import App from './App';
import './index.css';
//ReactDOM.render(<App />,document.getElementById('root'));

import { createStore } from 'redux';
import { Provider } from 'react-redux';

import postReducer from './reducers/postReducer';

const store = createStore(postReducer);

ReactDOM.render(
    <Provider store={store}>
        <App />
    </Provider>, document.getElementById('root')
);


파일명 : App.js
import React, { Component } from 'react';
import PostForm from './PostForm';
import AllPost from './AllPost';

class App extends Component {
  render() {
      return (
        <div className="App">
            <div className="navbar">
              <h2 className="center ">Post It</h2>
            </div>
            <PostForm />
            <AllPost />
        </div>
      );
    }
  }
export default App;

파일명 : post.js
import React, { Component } from 'react';
import {connect} from 'react-redux';

class Post extends Component {
  render() {
    return (
        <div className="post">
          <h2 className="post_title">{this.props.post.title}</h2>
          <p className="post_message">{this.props.post.message}</p>
          <div className="control-buttons">
            <button className="edit"
            onClick={() => this.props.dispatch({ type: 'EDIT_POST', id: this.props.post.id })
            }
            >Edit</button>
            <button className="delete"
            onClick={() => this.props.dispatch({ type: 'DELETE_POST', id: this.props.post.id })}
            >Delete</button>
          </div>
      </div>
    );
 }
}
export default connect()(Post);

파일명 : PostForm.js
import React, { Component } from 'react';
//추가
import {connect} from 'react-redux';
class PostForm extends Component {

    //함수 추가하기 
    handleSubmit = (e) => {
        //본래 기능 막고 
        e.preventDefault();
        const title = this.getTitle.value;
        const message =  this.getMessage.value;
        const data = {
            id: new Date(),
            title,
            message,
            //추가 
            editing:false
        }

        //추가
        console.log(data)
        this.props.dispatch({ type:'ADD_POST',  data});
        this.getTitle.value = '';
        this.getMessage.value = '';


    }
    render() {
        return (

            <div className="post-container">
                <h1 className="post_heading">Create Post</h1>
                    <form  className="form" onSubmit={this.handleSubmit}>
                        <input required type="text" ref={(input)=>this.getTitle = input} 
                            placeholder="Enter Post Title"/>
                        <br /><br />
                        <textarea required rows="5" ref={(input)=>this.getMessage = input} cols="28" 
                            placeholder="Enter Post" />
                        <br /><br />
                        <button>Post</button>
                    </form>
            </div>
        );
    }
}
//export default PostForm;

export default connect()(PostForm);


파일명 : AllPost.js
/*import React, { Component } from 'react';

class AllPost extends Component {
  render() {
    return (
    <div>
      <h1>All Posts</h1>
    </div>
    );
   }
}

export default AllPost;
*/
import React, { Component } from 'react';

import { connect } from 'react-redux';
import Post from './post';

import EditComponent from './EditComponent';

class AllPost extends Component {
    render() {
        return (
            <div className="post_heading">
                <h1>All Posts</h1>

                {this.props.posts.map((post) => (
                    <div key={post.id}>
                        {post.editing ? 
                            <EditComponent post={post} key={post.id} /> :
                            <Post key={post.id} post={post} />
                        }
                    </div>
                ))}

            </div>
        );
    }
}

const mapStateToProps = (state) => {
    return {
        posts: state
    }
}
export default connect(mapStateToProps)(AllPost);


파일명 : EditComponent.js
import React, { Component } from 'react';
import { connect } from 'react-redux';


class EditComponent extends Component {
    handleEdit = (e) => {
      e.preventDefault();
      const newTitle = this.getTitle.value;
      const newMessage = this.getMessage.value;
      const data = {
        newTitle,
        newMessage
      }
      this.props.dispatch({ type: 'UPDATE', id: this.props.post.id, data: data })
    }
    render() {
      return (
        <div className="post">
          <form className="form" onSubmit={this.handleEdit}>
            <input required type="text" ref={(input) => this.getTitle = input}
            defaultValue={this.props.post.title} placeholder="Enter Post Title" /><br /><br />
            <textarea required rows="5" ref={(input) => this.getMessage = input}
            defaultValue={this.props.post.message} cols="28" placeholder="Enter Post" /><br /><br />
            <button>Update</button>
          </form>
        </div>
      );
  }
}
export default connect()(EditComponent);


파일명 : /reducers/postReducer.js
//postReducer.js
/*const postReducer = (state = [], action) => {

}
export default postReducer;
*/

const postReducer = (state = [], action) => {
    switch(action.type) {
        case 'ADD_POST':
            return state.concat([action.data]);
        case 'DELETE_POST':
            return state.filter((post)=>post.id !== action.id);
        case 'EDIT_POST':
            return state.map((post)=>post.id === action.id ?
             {...post, editing:!post.editing}:post)
        case 'UPDATE':
        return state.map((post)=>{
            if(post.id === action.id) {
                return {
                    ...post,
                    title:action.data.newTitle,
                    message:action.data.newMessage,
                    editing: !post.editing
                }
            } 
            else return post;
        })
        default:
            return state;
    }
}
export default postReducer;
```






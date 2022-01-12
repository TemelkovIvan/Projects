import React, { Component } from 'react'
import Welcome from './components/Welcome'
import Timer from './components/Timer'
import './App.css'

class App extends Component {
  render() {
    let welcomeProps = {
      title: 'Hello',
      subtitle: 'from React'
    }
    return (
      <div className='App'>
        <Welcome {...welcomeProps} specificClass='green' />
        <Welcome title='Hello' subtitle='from Ivan' />
        <Welcome title='Hello' specificClass='green'/>
        <Timer />
      </div>

    )

  }
}

export default App;

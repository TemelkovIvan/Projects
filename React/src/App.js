import React, { Component } from 'react'
import Welcome from './components/Welcome'
import './App.css'

class App extends Component {
  render() {
    return (
      <div className='App'>
        <Welcome title='Hello' subtitle='from React' specificClass='green' />
        <Welcome title='Hello' subtitle='from Ivan' />
        <Welcome title='Hello' specificClass='green'/>
      </div>

    )

  }
}

export default App;

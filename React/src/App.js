import React, { Component } from 'react'
import Welcome from './components/Welcome'
import './App.css'

class App extends Component {
  render() {
    return (
      <div className='App'>
        <Welcome title='Hello' subtitle='from React' />
        <Welcome title='Hello' subtitle='from Ivan' />
      </div>

    )

  }
}

export default App;

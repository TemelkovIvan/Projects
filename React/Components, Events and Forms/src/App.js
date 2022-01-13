import React, { Component } from 'react'
import Welcome from './components/Welcome'
import Timer from './components/Timer'
import ButtonWithClick from './components/ButtonWithClick'
import Container from './components/Container'
import './App.css'
import RegisterForm from './components/RegisterForm'

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
        <br />
        <br />
        <ButtonWithClick />
        <RegisterForm />
        <Container />
      </div>
      

    )

  }
}

export default App;

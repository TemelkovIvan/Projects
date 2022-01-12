import React, { Component } from 'react'

class Button extends Component {
    constructor (props) {
        super(props)

        this.buttonClick = this.buttonClick.bind(this)

        this.state = {
            count: 0,
            isOn: true
        }
    }

    buttonClick () {
        this.setState(prevState => ({
           count: prevState.count + 1,
           isOn: !prevState.isOn
        }))
    }

    render () {
        return (
            <button onClick={this.buttonClick}>
                {this.props.text} - Clicked {this.state.count} times!
                {this.state.isOn ? 'ON' : 'OFF'}
            </button>
        )
    }
}

export default Button
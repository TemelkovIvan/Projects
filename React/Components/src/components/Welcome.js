import React, { Component } from 'react'
import Logo from './Logo'
import Button from './Button'
import './Welcome.css'

class Welcome extends Component {
    render () {
        let title = this.props.title || 'Title'
        let subtitle = this.props.subtitle || 'Subtitle'
        let specificClass =
            'Welcome-' + (this.props.specificClass || 'default')
        return (
            <div className={specificClass}>
                <h1>{title}</h1>
                <h2>{subtitle}</h2>
                <Logo />
                <br />
                <br />
                <Button text='Some text'/>
            </div>
        )
    }
}

export default Welcome
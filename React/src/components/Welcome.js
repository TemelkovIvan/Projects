import React, { Component } from 'react'

class Welcome extends Component {
    render () {
        let title = this.props.title || 'Title'
        let subtitle = this.props.subtitle || 'Subtitle'
        return (
            <div>
                <h1>{title}</h1>
                <h2>{subtitle}</h2>
            </div>
        )
    }
}

export default Welcome
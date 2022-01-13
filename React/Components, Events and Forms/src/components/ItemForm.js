import React, { Component } from 'react'

export default class ItemForm extends Component {
    constructor (props) {
        super()

        this.state = {
            itemName: '',
            error: ''
        }

        this.onInputChanged = this.onInputChanged.bind(this)
        this.onItemSaved = this.onItemSaved.bind(this)
    }

    onInputChanged (event) {
        this.setState({
            itemName: event.target.value
        })
    }

    onItemSaved (event) {
        event.preventDefault()

        if (!this.state.itemName) {
            this.setState ({
                error: 'Item name cannot be empty!'
        })  
        return
    } else {
            this.setState ({
                error: ''
            })

        }

        this.props.addItem(this.state.itemName)
    }
    

    render () {
        return (
            <form onSubmit={this.onItemSaved}>
                Item Name:
                <input
                type='text'
                name='name'
                onChange={this.onInputChanged}
                value={this.state.itemName}
                />
                <br />
                <input type='submit' /><br />
                {this.state.error}
            </form>
        )
    }
}
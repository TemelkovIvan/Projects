import React, { Component } from 'react'
import ItemForm from './ItemForm'
import List from './List'

export default class Container extends Component {
    constructor (props) {
        super()

        this.state = {
            items: []
        }

        this.addItem = this.addItem.bind(this)
    }

    addItem (name) {

        this.setState(prevState => {
            
            let items = prevState.items
            
            items.push ({
                id: items.length + 1,
                name
                
        })
        return {items}      
        })
        
        
    }

    render () {
        return (
            <div>
                <h1>My List</h1>
                <List items={this.state.items}/>
                <ItemForm addItem={this.addItem}/>
            </div>
        )
    }
} 
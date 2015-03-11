React = require 'react'
{RouteHandler} = require 'react-router'

module.exports = React.createClass
  render: ->
    {data, query} = @props

    <div id="react-app">
      Hello!
    </div>

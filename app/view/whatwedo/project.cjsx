React = require 'react'
{Link} = require 'react-router'

module.exports = React.createClass

  render: ->
    {title} = @props
    <div>
      <h2>{ title }</h2>
    </div>

React = require 'react'

module.exports = React.createClass
  render: ->
    {title, foo} = @props
    <div className="col-xs-12 col-md-5">
      <div className="sidebar">
        <h3>{ title }</h3>
        { content }
      </div>
    </div>

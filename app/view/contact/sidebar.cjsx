React = require 'react'

module.exports = React.createClass
  render: ->
    {title, content} = @props
    <div className="col-xs-12 col-md-5">
      <div className="sidebar">
        <h3>{ title }</h3>
        <span dangerouslySetInnerHTML={ __html: content }/>
      </div>
    </div>

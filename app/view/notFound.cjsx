React = require 'react'

module.exports = React.createClass
  render: ->
    {content} = @props['404']

    <div className="content" dangerouslySetInnerHTML={ __html: content }/>

React = require 'react'

module.exports = React.createClass
  render: ->
    {content, email, subhead, title, filename} = @props
    className = "plain #{filename}"
    <div className={className}>
      <h4>{title}</h4>
      <h5>{subhead}</h5>
      <span dangerouslySetInnerHTML={ __html: content }/>
      <div>
        <a href="mailto:{email}">{email}</a>
      </div>
    </div>

React = require 'react'

Sidebar = require './sidebar'
Form = require './form'

module.exports = React.createClass
  render: ->
    {formTitle, areweagoodfit} = @props.tellusaboutyou
    <div className="contact">
      <div className="row">
        <Form formTitle={formTitle} />
        <Sidebar title={areweagoodfit.title} content={areweagoodfit.content} />
      </div>
    </div>

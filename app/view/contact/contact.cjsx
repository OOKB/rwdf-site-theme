React = require 'react'

Sidebar = require './sidebar'
Form = require './form'

module.exports = React.createClass
  render: ->
    {formTitle, areweagoodfit} = @props.tellusaboutyou
    console.log 'contact'
    <div className="contact">
      <Form formTitle={formTitle} />
      <Sidebar title={areweagoodfit.title} content={areweagoodfit.content} />
    </div>

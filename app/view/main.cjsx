React = require 'react'
{RouteHandler} = require 'react-router'

Contact = require './contact/contact'

module.exports = React.createClass
  render: ->
    {data, query} = @props
    tellus = data.db.tellusaboutyou
    <div id="react-app">
      <Contact areweagoodfit={tellus.areweagoodfit} formTitle={tellus.formTitle} />
    </div>

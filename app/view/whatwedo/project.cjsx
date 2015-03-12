React = require 'react'
{Link, State} = require 'react-router'
_ = require 'lodash'

module.exports = React.createClass
  mixins: [State]
  render: ->
    pid = @getParams().projectId
    project = _.find @props.whatwedo.projects.contents, {filename: pid}
    unless project
      msg = "Project (#{pid}) not found."
      return <h2>{ msg }</h2>
    {title} = project
    <div>
      <h2>{ title }</h2>
    </div>

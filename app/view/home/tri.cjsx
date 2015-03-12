React = require 'react'
{Link} = require 'react-router'

TriEl = require './triEl'

RowEl = (props) ->
  props.key = props.filename
  props.className = "col-xs-12 col-sm-4 trio"
  React.createElement(TriEl, props)

module.exports = React.createClass

  render: ->
    {contents} = @props

    <div className="triptych">
      <div className="row">

      { contents.map RowEl }

      </div>
    </div>

React = require 'react'
{Link} = require 'react-router'

Row = React.createClass
  render: ->
    {link, title, content} = @props
    <div className="col-xs-12 col-sm-6">
      <h3><Link to={link}>{ title }</Link></h3>
      <div dangerouslySetInnerHTML={ __html: content }/>
    </div>

module.exports = React.createClass

  render: ->
    {bigidea, legacy} = @props

    <div className="add-top">
      <div className="row home-content">
        { React.createElement(Row, legacy) }
        { React.createElement(Row, bigidea) }
      </div>
    </div>

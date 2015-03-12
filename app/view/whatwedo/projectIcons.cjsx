React = require 'react'
_ = require 'lodash'
{Link} = require 'react-router'

# <li> Category Element.
Category = React.createClass
  render: ->
    {id} = @props
    catLink = '/whatwedo/'+id
    <li className={id}>
      <Link to={catLink}>{id}</Link>
    </li>

CatEl = (id) ->
  React.createElement(Category, {id:id, key:id})

# Main page section html.
module.exports = React.createClass
  render: ->
    {className, catIds} = @props
    className = "icons categories " + (className or '')
    <ul className={className}>
      { _.map catIds, CatEl }
    </ul>

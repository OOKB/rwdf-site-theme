React = require 'react'

{Navigation, State} = require 'react-router'

module.exports = React.createClass

  mixins: [Navigation, State]

  handleChange: (e) ->
    searchTxt = @refs.searchTxt.getDOMNode().value
    q = @getQuery()
    q.search = searchTxt.toLowerCase()

    @replaceWith '/', {}, q

  render: ->
    q = @getQuery() or {}
    <div role="form" id="search" className="form-group">
      <input type="text" ref="searchTxt" value={q.search} onChange={@handleChange}
        onKeyDown={@keyDown} className="form-control" name="item-search"
        placeholder="Search by name" />
    </div>

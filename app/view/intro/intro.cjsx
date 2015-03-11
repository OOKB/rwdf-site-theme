React = require 'react'

{body} = require '../../data/intro.json'

module.exports = React.createClass
  # getInitialState: ->

  render: ->
    <article id="intro">
      <div className="container" dangerouslySetInnerHTML={__html: body} />
    </article>

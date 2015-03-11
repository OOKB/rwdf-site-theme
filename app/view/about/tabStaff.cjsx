React = require 'react'

Person = require './person'
PersonEl = (props) ->
  props.key = props.filename
  React.createElement(Person, props)

module.exports = React.createClass
  render: ->
    {images, contents, filename, title} = @props
    if images and images[0]
      {url} = images[0]
      image =
        <aside className="col-xs-12 col-sm-4 accompany">
          <img src={url} alt={filename} />
        </aside>
    else
      image = false

    className = "col-xs-12 col-sm-8 #{filename}"
    <div>
      <h3 className>{title}</h3>
      <div className="row">
        <section className={className}>
          { contents.map PersonEl }
        </section>
        {image}
      </div>
    </div>

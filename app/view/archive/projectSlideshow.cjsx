React = require 'react'
{Link} = require 'react-router'
_ = require 'lodash'

module.exports = React.createClass
  getInitialState: ->
    index: 0

  render: ->
    {images, title} = @props
    {index} = @state

    firstIndex = 0
    lastIndex = images.length-1
    img = images[index]

    goNext = (e) =>
      e.preventDefault()
      nextIndex = if index is lastIndex then firstIndex else index + 1
      @setState index: nextIndex
    goPrev = (e) =>
      e.preventDefault()
      prevIndex = if index is firstIndex then lastIndex else index - 1
      @setState index: prevIndex

    <div id="img-carousel" className="carousel slide" data-ride="carousel">

      <div className="carousel-inner">
        <div className="item active">
          <img src={ img.url+'?size=l' } alt={title} />
        </div>
      </div>

      <a className="left carousel-control" href="#" title="Prev Image" onClick={goPrev} />
      <a className="right carousel-control" href="#" title="Next Image" onClick={goNext} />

    </div>

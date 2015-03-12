React = require 'react'
{Link} = require 'react-router'
_ = require 'lodash'

module.exports = React.createClass
  render: ->
    {images, title} = @props

    if images[0]
      imgSrc = images[0].url+'?size=l'
    else
      imgSrc = false

    <div className="imagewrapper">

      <div className="leadimage">
        <div className="singleimage">
          <img src={imgSrc} alt={title} />
        </div>
      </div>

    </div>

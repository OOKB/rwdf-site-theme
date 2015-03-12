React = require 'react'
{Link} = require 'react-router'
_ = require 'lodash'
ProjectSlideshow = require './projectSlideshow'

module.exports = React.createClass
  render: ->
    {images, title} = @props
    if len = images?.length
      if len is 1
        imageContainer =
          <div className="leadimage">
            <div className="singleimage">
              <img src={imgSrc} alt={title} />
            </div>
          </div>
      else
        imageContainer = <ProjectSlideshow images={images} title={title} />
    else
      imageContainer = false

    <div className="imagewrapper">
      {imageContainer}
    </div>

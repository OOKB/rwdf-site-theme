React = require 'react'

module.exports = React.createClass
  render: ->
    {title, content, filename, images} = @props
    if images and images[0]
      {url} = images[0]
      image =
        <aside className="col-xs-12 col-sm-4 accompany">
          <img src={url} alt={filename} />
        </aside>
    else
      image = false

    <div className="tab-pane fade in active" id={filename}>
      <div className="row">
        <div className="col-xs-12 col-sm-8">
          <h3>{title}</h3>
          <span dangerouslySetInnerHTML={ __html: content }/>
        </div>
        {image}
      </div>
    </div>

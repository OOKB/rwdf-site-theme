React = require 'react'
{Link} = require 'react-router'

Row = React.createClass
  render: ->
    {filename, title, images, featuretitle, featureimg} = @props
    titleTxt = "#{featuretitle or title} →"
    linkUrl = '/whatwedo/projects/'+filename
    if featureimg
      imgSrc = 'http://db.rwdfoundation.org'+linkUrl+'/'+featureimg
    else
      imgSrc = images[0].url
    <div className="col-xs-12 col-sm-4 trio">
      <Link to={linkUrl}><img src={ imgSrc } alt={filename} /></Link>
      <div className="text overlay">
        <h3><Link to={linkUrl}> { titleTxt } </Link></h3>
      </div>
    </div>

RowEl = (props) ->
  props.key = props.filename
  React.createElement(Row, props)

module.exports = React.createClass

  render: ->
    {contents} = @props

    <div className="triptych">
      <div className="row">

      { contents.map RowEl }

      </div>
    </div>

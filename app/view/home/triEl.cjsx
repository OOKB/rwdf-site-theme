React = require 'react'
{Link} = require 'react-router'

module.exports = React.createClass
  render: ->
    {filename, url, title, images, featuretitle, featureblurb, featureimg, className, feature} = @props
    titleTxt = "#{featuretitle or title} →"
    linkUrl = url
    if featureimg
      imgSrc = 'http://db.rwdfoundation.org'+linkUrl+'/'+featureimg
    else
      imgSrc = images[0].url
    className = className or "col-xs-12 col-sm-4"

    if feature
      size = '?size=xl'
      if featureblurb
        blurb = <p className="lead"><Link to={linkUrl}>{featureblurb} &rarr;</Link></p>
      else
        blurb = false
      overlay =
        <div>
          <h3><Link to={linkUrl}> { titleTxt } </Link></h3>
          {blurb}
        </div>
    else
      size = '?size=l'
      overlay =
        <h3><Link to={linkUrl}> { titleTxt } </Link></h3>

    <div className={className}>
      <Link to={linkUrl}><img src={ imgSrc+size } alt={filename} /></Link>
      <div className="text overlay">
        {overlay}
      </div>
    </div>

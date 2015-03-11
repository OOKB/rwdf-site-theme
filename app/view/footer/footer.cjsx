React = require 'react'

module.exports = React.createClass
  # getInitialState: ->

  render: ->
    {email, phone, fax} = @props

    <footer className="container">
      <div className="diag-divider" />
      <div className="row">
        <div className="col-xs-12 col-sm-3">
          <img src="/media/bigd.png" className="logo-sm" />
          <address>
            The Robert W. Deutsch Foundation <br />
            Suite 201, The Exchange <br />
            1122 Kenilworth Drive <br />
            Towson, MD 21204
          </address>
        </div>
        <p className="col-xs-12 col-sm-3">
          Email us at <a href="mailto:{email}" target="_blank">{email}</a> <br />
          Phone: {phone} <br />
          Fax: {fax} <br />
          <a href="https://twitter.com/DeutschFound" target="_blank"><img src="/media/socialmask_twitter.png" className="icongray" /></a>
          <a href="https://www.facebook.com/RobertWDeutschFoundation" target="_blank"><img src="/media/socialmask_fbook.png" className="icongray" /></a>
          <a href="http://rwdfblog.com/" target="_blank"><img src="/media/socialmask_wpress.png" className="icongray" /></a>
          <a href="https://www.flickr.com/photos/101614637@N07/" target="_blank"><img src="/media/socialmask_flickr.png" className="icongray" /></a>
        </p>
        <ul className="menu col-xs-12 col-sm-2 col-sm-offset-1">
          <li><a href="/">Home</a></li>
          <li><a href="/whoweare/">Who We Are</a></li>
          <li><a href="/whatwedo/">What We Do</a></li>
          <li><a href="/tellusaboutyou/">Tell Us About You</a></li>
          <li><a href="http://rwdfblog.com/">Read Our Blog »</a></li>
          <li><a href="/whoweare/form990/fy2012-990.pdf">IRS Form 990 (FY2012)</a></li>
        </ul>
        <p className="col-xs-12 col-sm-3 text-right">© Deutsch Foundation 2015</p>
      </div>
      <div className="row">
        <p className="col-xs-12 col-sm-3">
          Site by <a href="http://www.ookb.co/" target="_blank">OOKB</a> <br />
          Powered by <a href="http://www.cape.io/" target="_blank">CAPE</a> &amp; <a href="http://www.ezle.co/" target="_blank">EZLE</a>
        </p>
      </div>
    </footer>

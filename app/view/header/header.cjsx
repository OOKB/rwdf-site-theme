React = require 'react'
{Link} = require 'react-router'

module.exports = React.createClass

  render: ->
    <header className="navbar" role="navigation">
      <nav className="container">
        <div className="border-bottom">
          <div className="navbar-header">
            <button type="button" className="navbar-toggle" data-toggle="collapse" data-target="#mainmenu">
              <span className="sr-only">Toggle navigation</span>
              <p>Menu</p>
            </button>
            <Link className="logo brand" to="/"><img src="http://db.rwdfoundation.org/media/rwdfbiglogo.jpg" alt="RW Deutsch Foundation Official Logo" /></Link>
          </div>
          <div className="collapse navbar-collapse" id="mainmenu">
            <ul className="nav navbar-nav navbar-right">
              <li><Link to="whoweare/">Who We Are</Link></li>
              <li><Link to="whatwedo/">What We Do</Link></li>
              <li><Link to="tellusaboutyou/">Tell Us About You</Link></li>
              <li className="blog"><a href="http://rwdfblog.com/" target="_blank">Read Our Blog »</a></li>
              <li className="social"><a href="https://www.facebook.com/RobertWDeutschFoundation" target="_blank"><img src="/media/socialmask_fbook.png" className="icongreen" /></a></li>
              <li className="social last"><a href="https://twitter.com/DeutschFound" target="_blank"><img src="/media/socialmask_twitter.png" className="icongreen" /></a></li>
            </ul>
          </div>
        </div>
      </nav>
    </header>

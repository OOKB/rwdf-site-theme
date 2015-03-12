React = require 'react'
{Link} = require 'react-router'
_ = require 'lodash'
HomeContent = require './HomeContent'
Tri = require './tri'
TriEl = require './triEl'

module.exports = React.createClass

  render: ->
    {bigidea, legacy, hed, dek} = @props.homepage
    projects = @props.whatwedo.projects
    blogLinkTxt = "Additional information on many of these projects can be found on the blog"
    featured = projects.featured.map (id) ->
      _.find projects.contents, {filename: id}
    feature = featured.shift()
    feature.className = "col-xs-12 col-sm-8 feature"
    feature.feature = true

    right = featured.shift()
    tri = featured.slice(0, 3)

    <div>

      <div id="gridded">
        <div className="hero">
          <div className="row">

            { React.createElement(TriEl, feature) }

            <div className="col-xs-12 col-sm-4 tagline">
              <div className="text">
                <h1>{{ hed }}</h1>
              </div>
            </div>

            { React.createElement(TriEl, right) }

          </div>
        </div>

        <Tri contents={tri} />

        <div className="row">
          <p className="col-xs-12 lead">
            <a className="btn btn-large btn-info blog" href="http://rwdfblog.com" target="_blank">
              { blogLinkTxt }
            </a>
          </p>
        </div>

      </div>

      <div className="index jumbotron add-top">
        <div className="row">
          <div className="col-xs-12">
            <div className="diag-divider"></div>
          </div>
          <div className="col-xs-12 jumbo-text">
            <p className="lead">{ dek }</p>
          </div>
        </div>
      </div>

      <HomeContent bigidea={bigidea} legacy={legacy} />

    </div>

React = require 'react'
{Link} = require 'react-router'
_ = require 'lodash'
HomeContent = require './HomeContent'
Tri = require './tri'

module.exports = React.createClass

  render: ->
    {bigidea, legacy, hed, dek} = @props.homepage
    projects = @props.whatwedo.projects
    blogLinkTxt = "Additional information on many of these projects can be found on the blog"
    featured = projects.featured.map (id) ->
      _.find projects.contents, {filename: id}
    feature = featured.shift()
    right = featured.shift()
    tri = featured.slice(0, 3)

    <div>

      <div>

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

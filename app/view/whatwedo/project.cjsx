React = require 'react'
{Link, State} = require 'react-router'
_ = require 'lodash'

ProjImgs = require './projectImgs'

module.exports = React.createClass
  mixins: [State]
  render: ->

    pid = @getParams().projectId
    projectIndex = @props.projectIndex[pid]
    if _.isUndefined projectIndex
      msg = "Project (#{pid}) not found."
      return <h2>{ msg }</h2>
    projects = @props.whatwedo.projects.contents
    {title, images, prevId, nextId} = projects[projectIndex]
    prev = projects[prevId]
    next = projects[nextId]
    <div>

      <div className="row project">
        <div className="col-xs-12 col-sm-8 col-sm-offset-2">

          <ProjImgs images={images} title={title} />

          <h2>{ title }</h2>

          <div id="blog-read-more" className="add-top">
            <h3>Read more on the blog:</h3>
          </div>
        </div>
      </div>

      <div className="row minus-top controls">
        <div className="prev previous col-xs-6 col-sm-2 ">
          <Link to={prev.url} title={ prev.title }>&larr; Previous</Link>
        </div>
        <div className="next col-xs-6 col-sm-2 col-sm-offset-8">
          <Link to={next.url} title={ next.title }> Next &rarr; </Link>
        </div>
      </div>

    </div>

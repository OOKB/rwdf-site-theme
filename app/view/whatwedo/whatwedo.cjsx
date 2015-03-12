React = require 'react'
_ = require 'lodash'
{Link, State} = require 'react-router'
ProjectIcons = require './projectIcons'

# <li> Filter element in the left sidebar.
Filter = React.createClass
  mixins: [State]
  render: ->
    {title, id, icon} = @props
    url = "/whatwedo/#{if id isnt 'textonly' then id else ''}"
    unless icon is false
      icon = <i className={"icon-#{id} icongreen iconsidenav"}></i>
      className = "icons #{id}"
    else
      className = "#{id}"
    if @isActive(url) then className += ' active'
    <li className={className}>
      <Link to={url} >
        {icon}
        <p>{title}</p>
      </Link>
    </li>

FilterEl = (props) ->
  props.key = props.id
  React.createElement(Filter, props)

# <li> Project element for the main part of the page.
Project = React.createClass
  render: ->
    {title, filename, summary, teaser, catIds, url} = @props

    <li className="project brick">
      <ProjectIcons catIds={catIds} className="pull-right" />
      <h3 className="project-title">
        <Link to={url}>{ title }</Link>
      </h3>
      <p className="project-content">
        { summary or teaser }
      </p>
    </li>

ProjectEl = (props) ->
  props.key = props.filename
  React.createElement(Project, props)

# Main page section html.
module.exports = React.createClass
  mixins: [State]
  render: ->
    filters = [
      {id: 'textonly', title: 'View All Categories', icon: false}
      {id: 'science', title: 'Science & Tech'}
      {id: 'education', title: 'Education'}
      {id: 'arts', title: 'Arts & Culture'}
      {id: 'justice', title: 'Social Justice'}
      {id: 'community', title: 'Community Development'}
    ]
    {contents} = @props.whatwedo.projects
    if filterId = @getParams().filterId
      contents = _.filter contents, (item) ->
        _.contains item.catIds, filterId

    <div>

      <div className="row">
        <div className="col-xs-12 col-sm-2">
          <ul className="side-nav" id="filters">
            {
              filters.map FilterEl
            }
          </ul>
        </div>

        <ul className="col-xs-12 col-sm-10 isotope-area" id="projects">
          {
            contents.map ProjectEl
          }
        </ul>
      </div>

      <div className="row">
        <p className="col-xs-12 col-md-8 col-md-offset-2 lead ">
          <a className="btn btn-large btn-info blog" href="http://rwdfblog.com" target="_blank">
            Additional information on many of these projects can be found on the blog
          </a>
        </p>
      </div>

    </div>

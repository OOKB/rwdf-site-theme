React = require 'react'
_ = require 'lodash'
{Link, State} = require 'react-router'

# For some reason some posts have multi-word category names.
filterIdObj =
  arts: 'arts and culture'
  science: 'science and tech'
  justice: 'social justice'
  community: 'community development'
filterStrObj = _.invert filterIdObj

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

Project = React.createClass
  render: ->
    {title, filename, summary, teaser, categories} = @props
    catEl = (id) ->
      if filterStrObj[id]
        id = filterStrObj[id]
      url = '/whatwedo/'+id
      <li className={id} key={id}>
        <Link to={url}>{id}</Link>
      </li>

    <li className="project brick">
      <ul className="icons categories pull-right">
        {_.map categories, catEl}
      </ul>
      <h3 className="project-title">
        <a href="#">{ title }</a>
      </h3>
      <p className="project-content">
        { summary or teaser }
      </p>
    </li>

ProjectEl = (props) ->
  props.key = props.filename
  React.createElement(Project, props)

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
      if filterIdObj[filterId]
        filterId = filterIdObj[filterId]
      contents = _.filter contents, (item) ->
        _.contains item.categories, filterId

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

React = require 'react'
http = require 'jsonp'

# Main page section html.
module.exports = React.createClass
  getInitialState: ->
    entries: [{link: false, title: '[ loading... ]'}]

  componentDidMount: ->
    {tag} = @props
    endpoint = "http://ajax.googleapis.com/ajax/services/feed/load?v=1.0&num=10&q=http://rwdfblog.com/tag/"
    endpoint += tag + "/feed/"
    #console.log endpoint
    http endpoint, (err, res) =>
      if !err and res?.responseData?.feed?.entries
        @setState entries: res.responseData.feed.entries
      else
        @setState entries: [{title: 'Error loading blog entries.'}]

  render: ->
    {entries} = @state
    {tag} = @props

    <div id="blog-read-more" className="add-top">
      <h3>Read more on the blog:</h3>
      <ul id="blog-entries-list">
        {
          entries.map (entry, i) ->
            {title, link} = entry
            <li className="blog-entry" key={i}>
              {
                if link
                  <a href={link}> { title } </a>
                else
                  { title }
              }
            </li>
        }
      </ul>
    </div>

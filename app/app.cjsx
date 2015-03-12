React = require 'react'
_ = require 'queries'
Router = require 'react-router'
{Route, DefaultRoute} = Router
http = require 'superagent'
Routes = require './routes'

# MODIFY PROJECT DATA
# For some reason some posts have multi-word category names.
filterIdObj =
  arts: 'arts and culture'
  science: 'science and tech'
  justice: 'social justice'
  community: 'community development'
filterStrObj = _.invert filterIdObj

inBrowser = typeof window isnt "undefined"

# The goal with this is to have the server and client call the same function to
# init the app.

App = (data, render) ->
  if not data.path then data.path = '/'
  data.db.projectIndex = {}
  projectsLength = data.db.whatwedo.projects.contents.length
  # Need to modify the data coming in a bit.
  data.db.whatwedo.projects.contents = _.map data.db.whatwedo.projects.contents, (proj, i) ->
    {categories, filename} = proj
    # Add to index.
    data.db.projectIndex[filename] = i
    proj.prevId = if i is 0 then projectsLength-1 else i-1
    proj.nextId = if i is projectsLength-1 then 0 else i+1
    # Fix silly categories array.
    proj.catIds = _.map categories, (cat) ->
      if filterStrObj[cat] then filterStrObj[cat] else cat
    # Create url. (This should probably be the dir value from the database.)
    proj.url = '/whatwedo/projects/'+filename
    return proj

  Render = (Handler) ->
    # This is the default props sent to the Index view.
    render Handler, data

  if inBrowser
    data.windowInnerWidth = window.innerWidth
    Router.run Routes, Router.HistoryLocation, Render
  else
    Router.run Routes, data.path, Render

if inBrowser
  window.onload = -> # Attach event handlers.
    # This is created specific to the client.
    render = (Handler, props) ->
      # console.log 'init'
      React.render React.createElement(Handler, props), document
    console.log 'Client js loaded. Fetch data.'
    http.get('/index.json').accept('json').end (err, res) =>
      if err
        return console.error err
      if res and res.body
        # Attach app to global window var as app.
        window.app = data = res.body
        # Trigger render.
        App data, render
        console.log 'Init react with data.'
      else
        console.error err or res

module.exports = App

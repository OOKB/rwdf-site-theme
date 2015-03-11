React = require 'react'
_ = require 'queries'
Router = require 'react-router'
{Route, DefaultRoute} = Router

Routes = require './routes'

data = require './data'

inBrowser = typeof window isnt "undefined"

# The goal with this is to have the server and client call the same function to
# init the app.

App = (vars, render) ->
  path = vars.path or '/'

  Render = (Handler) ->
    # This is the default props sent to the Index view.
    data.vars = vars
    render Handler, data

  if inBrowser
    data.windowInnerWidth = window.innerWidth
    Router.run Routes, Router.HistoryLocation, Render
  else
    Router.run Routes, path, Render

if inBrowser
  window.onload = -> # Attach event handlers.
    # Attach app to global window var as app.
    window.app = data
    # This is created specific to the client.
    render = (Handler, props) ->
      console.log 'init'
      React.render React.createElement(Handler, props), document
    App {}, render

module.exports = App

React = require 'react'
Router = require 'react-router'
{Route, DefaultRoute} = Router

Index = require './view/index'
Contact = require './view/contact/contact'
About = require './view/about/whoweare'

module.exports =

  <Route name="app" path="/" handler={Index}>
    <Route name="tellusaboutyou/" handler={Contact} />
    <Route name="whoweare/" handler={About} />
  </Route>

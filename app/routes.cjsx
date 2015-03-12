React = require 'react'
Router = require 'react-router'
{Route, DefaultRoute} = Router

Index = require './view/index'
Contact = require './view/contact/contact'
About = require './view/about/whoweare'
AboutTab = require './view/about/tab'

module.exports =

  <Route name="app" path="/" handler={Index}>
    <Route name="tellusaboutyou/" handler={Contact} />
    <Route name="whoweare/" handler={About} ignoreScrollBehavior>
      <Route path=":tabId" handler={AboutTab} />
      <DefaultRoute handler={AboutTab}/>
    </Route>
    <Route name="whatwedo/" handler={Contact} />
  </Route>

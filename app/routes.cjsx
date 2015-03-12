React = require 'react'
Router = require 'react-router'
{Route, DefaultRoute} = Router

Index = require './view/index'
Contact = require './view/contact/contact'
Homepage = require './view/home/home'
About = require './view/about/whoweare'
AboutTab = require './view/about/tab'
WhatWeDo = require './view/whatwedo/whatwedo'

module.exports =

  <Route name="app" path="/" handler={Index}>
    <DefaultRoute handler={Homepage}/>
    <Route name="tellusaboutyou/" handler={Contact} />
    <Route name="whoweare/" handler={About} ignoreScrollBehavior>
      <Route path=":tabId" handler={AboutTab} />
      <DefaultRoute handler={AboutTab}/>
    </Route>
    <Route name="whatwedo/:filterId?" handler={WhatWeDo} ignoreScrollBehavior />
  </Route>

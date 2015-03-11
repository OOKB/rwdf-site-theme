React = require 'react'
{RouteHandler} = require 'react-router'

Header = require './header/header'

module.exports = React.createClass
  render: ->
    {data} = @props
    {title, sha, description, author} = data
    appFileName = sha or 'app'
    cssFilePath = "/assets/#{appFileName}.css"
    jsFilePath = "/assets/#{appFileName}.js"

    page = React.createElement(RouteHandler, data.db)

    <html>
      <head>
        <title>{title}</title>
        <meta charSet="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <meta name="generator" content="CAPE.io, see www.cape.io" />
        <meta name="description" content={description} />
        <meta name="author" content={author} />
        <link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" media="screen" />
        <link rel="stylesheet" type="text/css" href={cssFilePath} />
        <link rel="stylesheet" type="text/css" href="/assets/print.css" media="print" />
      </head>
      <body>
        <Header />
        {page}
        <script src={jsFilePath} type="text/javascript" />
      </body>
    </html>

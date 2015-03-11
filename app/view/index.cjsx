React = require 'react'
{RouteHandler} = require 'react-router'

Header = require './header/header'
Footer = require './footer/footer'

module.exports = React.createClass
  render: ->
    {title, sha, description, author, email, phone, fax} = @props.db
    appFileName = sha or 'app'
    cssFilePath = "/assets/#{appFileName}.css"
    jsFilePath = "/assets/#{appFileName}.js"

    page = React.createElement(RouteHandler, @props.db)

    if false
      hed =
        <div class="jumbotron" id="page_hed">
          <div class="jumbo-text">
            <h1>{{ hed }}</h1>
            <p class="lead">{{ dek }}</p>
          </div>
        </div>
    else
      hed = false

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
        <div class="container inner main-content">
          {hed}
          {page}
        </div>
        <Footer email={email} phone={phone} fax={fax} />
        <script src={jsFilePath} type="text/javascript" />
      </body>
    </html>

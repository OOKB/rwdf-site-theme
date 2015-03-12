React = require 'react'
{RouteHandler, State} = require 'react-router'

Header = require './header/header'
Footer = require './footer/footer'

module.exports = React.createClass
  mixins: [State]
  render: ->
    {title, sha, description, author, email, phone, fax} = @props.db
    appFileName = sha or 'app'
    cssFilePath = "/assets/#{appFileName}.css"
    jsFilePath = "/assets/#{appFileName}.js"

    url = @getPathname()
    urlArray = url.split('/')

    if @props.db[urlArray[1]]
      pageData = @props.db[urlArray[1]]

    if pageData?.hed
      hed =
        <div className="jumbotron" id="page_hed">
          <div className="jumbo-text">
            <h1>{ pageData.hed }</h1>
            <p className="lead">{ pageData.dek }</p>
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
      </head>
      <body>
        <Header />
        <div className="container inner main-content">
          {hed}
          {React.createElement(RouteHandler, @props.db)}
        </div>
        <Footer email={email} phone={phone} fax={fax} />
        <script src={jsFilePath} type="text/javascript" />
      </body>
    </html>

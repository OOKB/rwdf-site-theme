nodejsx = require 'coffee-react/register'
React = require 'react'
argv = require('minimist')(process.argv.slice(2))

App = require '../app/app'

render = (Handler, props) ->
  markup = React.renderToString React.createElement(Handler, props)
  markup = "<!doctype html>\n" + markup
  console.log markup

App {path: argv._[0]}, render

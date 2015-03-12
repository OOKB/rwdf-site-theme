nodejsx = require 'coffee-react/register'
React = require 'react'
argv = require('minimist')(process.argv.slice(2))

http = require 'superagent'
fs = require 'fs-extra'

App = require '../app/app'

render = (Handler, props) ->
  markup = React.renderToString React.createElement(Handler, props)
  markup = "<!doctype html>\n" + markup
  console.log markup

# Request data from server.
http.get('http://localhost:8088/_api/data.json').accept('json').end (err, res) =>
  if err
    return console.error err
  if res and res.body
    data = res.body
    data.path = argv._[0]
    # Trigger render.
    App data, render
    # Save the data used for this request to index.json
    fs.outputJsonSync 'public/index.json', data
  else
    console.error err or res

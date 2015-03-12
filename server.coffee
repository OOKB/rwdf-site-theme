exec = require('child_process').exec
path = require 'path'
fs = require 'fs-extra'

Hapi = require 'hapi'
_ = require 'lodash'
async = require 'async'
Wreck = require 'wreck'
yaml = require 'js-yaml'

SECOND = 1000
MINUTE = 60 * SECOND
HOUR = 60 * MINUTE

server = new Hapi.Server {
  cache: require('catbox-redis')
}

server.connection {
  port: 8088
  routes:
    cors:
      additionalHeaders: ['X-Requested-With']
      override: false
}

server.register {
    register: require 'good'
    options:
      reporters: [
        {
          reporter: require('good-console')
          args: [{log: '*', response: '*'}]
        }
      ]
  }, (err) ->
    if err
      console.log 'Failed loading good plugin',
      console.error err
    else
      console.log 'Good lugin is good.'

getData = (qid, next) ->
  data = yaml.safeLoad(fs.readFileSync('content/data.yaml', 'utf8'))
  if data.api
    getData = _.mapValues data.api, (url) ->
      (cb) ->
        Wreck.get url, {json: true}, (err, resp, payload) ->
          cb err, payload
  else
    getData = {}
  async.parallel getData, (err, serverData) ->
    if err
      return next(err)
    _.merge data, serverData
    next(err, data)

server.method 'serverData', getData,
  cache:
    expiresIn: 48*HOUR
    staleIn: MINUTE
    staleTimeout: 150

server.route
  method: "GET"
  path: "/_api/{qid}.json"
  handler: (request, reply) ->
    server.methods.serverData request.params.qid, (err, res) ->
      if err then console.error err
      reply err or res
    return

server.route
  method: 'GET'
  path: '/{path*}'
  handler: (req, reply) ->
    p = req.params.path or ''
    if _.contains ['assets', 'media', 'css', 'styles', 'js', 'images', 'files'], p.split('/')[0]
      reply.file('public/'+p)
    else if _.contains ['.json', '.css', '.js', '.jpg', '.map', '.png', '.ico', '.gif', '.txt', '.md', '.yaml'], path.extname(p)
      reply.file('public/'+p)
    else
      console.log 'Start dynamic render: /', p
      exec 'coffee ./scripts/renderMarkup.coffee /'+p, (err, stdout, stderr) ->
        if err or stderr
          console.error err
        reply stderr or stdout or err

server.start ->
  console.log "info", "Server running at: " + server.info.uri
  return

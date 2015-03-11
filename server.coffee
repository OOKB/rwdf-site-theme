exec = require('child_process').exec
path = require 'path'

Hapi = require 'hapi'
_ = require 'lodash'

server = new Hapi.Server {
  #cache: require('catbox-redis')
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

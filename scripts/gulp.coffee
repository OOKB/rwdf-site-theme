# System
path = require 'path'
exec = require('child_process').exec
# System Alt
fs = require 'fs-extra'
# Gulp Utils
gulp = require 'gulp'
less = require 'gulp-less'
gutil = require 'gulp-util'
clean = require 'gulp-clean'
rename = require 'gulp-rename'
uglify = require 'gulp-uglify'
gdata = require 'gulp-data'
debug = require 'gulp-debug'
deploy = require 'gulp-gh-pages'
runSequence = require 'run-sequence'
markdown = require 'gulp-markdown-to-json'
yaml = require 'gulp-yaml'
sourcemaps = require 'gulp-sourcemaps'
buffer = require 'vinyl-buffer'
source = require 'vinyl-source-stream'
transform = require 'vinyl-transform'
#zopfli = require 'gulp-zopfli'

# Development
browserSync = require 'browser-sync'
browserify = require 'browserify'
exorcist = require 'exorcist'
watchify = require 'watchify'
_ = require 'lodash'

# Default gulp tasks watches files for changes
gulp.task "default", ['browser-sync'], ->
  #gulp.watch './app/**/*.*', ['templates', browserSync.reload]
  gulp.watch "styles/*.less", ["styles", browserSync.reload]
  gulp.watch 'static/**', ['static', browserSync.reload]
  return

# For development.
gulp.task "browser-sync", ['compile-watch', 'styles', 'static'], ->
  browserSync
    proxy: "localhost:8088"
    logConnections: true
    injectChanges: true
  return

# This generates the js app file.
gulp.task 'compile', ->
  browserified = transform (filename) ->
    b = browserify {debug: true, extensions: ['.cjsx', '.coffee']}
    b.add filename
    #b.transform 'coffee-reactify'
    b.bundle()
  gulp.src 'app/app.cjsx'
    .pipe browserified
    # Extract the map.
    .pipe transform(-> exorcist('./public/assets/app.js.map'))
    # Shrink the codebase.
    .pipe uglify()
    # Rename the file.
    .pipe rename('app.js')
    .pipe gulp.dest('./public/assets')

# WATCHIFY
opts = watchify.args
opts.extensions = ['.coffee', '.cjsx']
opts.debug = true
w = watchify browserify('./app/app.cjsx', opts)

gulp.task 'bundle', ->
  w.bundle()
    .on 'error', gutil.log.bind gutil, 'Browserify Error'
    .pipe source('app.js')
      .pipe buffer()
      .pipe(sourcemaps.init({loadMaps: true}))
      .pipe(sourcemaps.write('./'))
    .pipe gulp.dest('./public/assets')
    .pipe browserSync.reload({stream:true})

w.on 'update', () ->
  # Remove the sorted set (from Redis) that contains all valid compiled routes.
  runSequence 'bundle'

gulp.task 'compile-watch', (cb) ->
  runSequence 'bundle', cb
  return
# /WATCHIFY

  # Calling an external script for this.
  # exec 'coffee ./scripts/renderMarkup.coffee', (err, stdout, stderr) ->
  #   if stdout
  #     console.log stdout
  #   if stderr
  #     console.log stderr
  #   cb err

# Process LESS to CSS.
gulp.task 'styles', ->
  gulp.src(["styles/app.less", 'styles/print.less', 'styles/iefix.less'])
    .pipe less()
    .pipe gulp.dest("./public/assets")

# Copy static files.
gulp.task 'static', ->
  gulp.src('./static/**')
    .pipe gulp.dest('./public/')

# - - - - prod - - - -

gulp.task 'prod', ['prod_clean'], (cb) ->
  runSequence ['static'], ['compile', 'styles'], cb

# Remove contents from public directory.
gulp.task 'prod_clean', ->
  gulp.src('./public', read: false)
    .pipe(clean())


gulp.task 'deploy', ['prod'], ->
  gulp.src './public/**/*'
    .pipe deploy cacheDir: './tmp'

# gulp.task 'templatesProd', ->
#   exec('coffee gulp/compileProd.coffee')

gulp.task 'set_sha', (cb) ->
  r_ops =
    uri: 'https://api.github.com/repos/cape-io/mica.ezle.io/branches/master'
    json: true
    headers:
      'user-agent': 'request.js'
  r r_ops, (err, response, body) ->
    if err then throw err
    global.sha = body.commit.sha
    fs.outputJsonSync 'app/data/commit.json', body.commit
    cb()
  return

# Remove contents from prod directory.
gulp.task 'prod_clean', ->
  gulp.src('./prod', read: false)
    .pipe(clean())

gulp.task 'prod_static', ->
  gulp.src('./static/**')
    .pipe gulp.dest('./prod/')

gulp.task 'cssProd', ->
  runSequence 'set_sha', ['copy_css', 'templatesProd']
  return

gulp.task 'copy_css', ['styles'], ->
  gulp.src('./dev/app.css')
    .pipe(rename(global.sha+'.css'))
    .pipe(gulp.dest('./prod'))
  gulp.src('./dev/print.css')
    .pipe(gulp.dest('./prod'))

gulp.task 'compress', ->
  gulp.src("./prod/*.{js,css,html,json}")
    .pipe(zopfli())
    .pipe(gulp.dest("./prod"))

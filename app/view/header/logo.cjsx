React = require 'react'

module.exports = React.createClass

  render: ->
    <div>
      <div id="logo"></div>
      <div id="logobg">
        <canvas id="canvas" hidpi="on" style={background: 'transparent'} />
      </div>
    </div>

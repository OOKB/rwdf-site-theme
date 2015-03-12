React = require 'react'
{Link} = require 'react-router'

HomeContent = require './HomeContent'

module.exports = React.createClass

  render: ->
    {bigidea, legacy, hed, dek} = @props.homepage
    <div>
      <HomeContent bigidea={bigidea} legacy={legacy} />
    </div>

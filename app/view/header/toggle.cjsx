React = require 'react'


module.exports = React.createClass
  # getInitialState: ->

  render: ->
    {handleToggle} = @props

    <button onClick={handleToggle} className="toggle" type="button">
      Reveal Menu
    </button>

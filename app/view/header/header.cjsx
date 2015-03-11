React = require 'react'
_ = require 'lodash'

Logo = require './logo'
Nav = require './nav'

module.exports = React.createClass
  getInitialState: ->
    imgNum: @props.data.imgNum

  componentDidMount: ->
    {headerImgQty} = @props.data
    @setState imgNum: _.random(1, headerImgQty)

  render: ->
    {imgNum} = @state
    {title} = @props.data
    className = "header-art-#{imgNum}"

    <header className={className}>
      <Logo />
      <h1 style={display: 'none'}>{title}</h1>
      <a href="#intro" className="down-arrow">\/</a>
      <Nav data={@props.data} />
    </header>

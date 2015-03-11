React = require 'react'
{RouteHandler, State} = require 'react-router'

Tab = require './tab'

module.exports = React.createClass
  mixins: [State]
  render: ->
    {formTitle, areweagoodfit} = @props.whoweare
    tabId = @getParams().tabId or 'our-values'
    tabProps = @props.whoweare[tabId]

    <div className="row">
      <div className="tabbable">

        <div className="col-xs-12 col-sm-2">
          <ul className="side-nav" id="myTab">
            <li className="active"><a href="#whoweare/our-values" data-toggle="tab">Our Values</a></li>
            <li><a href="#whoweare/robert-florence" data-toggle="tab">Robert &amp; Florence</a></li>
            <li><a className="#whoweare/staff" href="#staff" data-toggle="tab">Directors &amp; Staff</a></li>
          </ul>
        </div>

        <div className="tab-content col-xs-12 col-sm-10">

          { React.createElement(RouteHandler, tabProps) }

        </div>

      </div>
    </div>

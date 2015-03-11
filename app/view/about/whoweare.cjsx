React = require 'react'
{RouteHandler} = require 'react-router'

Tab = require './tab'

module.exports = React.createClass
  render: ->
    {formTitle, areweagoodfit} = @props.whoweare
    ourValues = @props.whoweare['our-values']

    <div className="row">
      <div className="tabbable">

        <div className="col-xs-12 col-sm-2">
          <ul className="side-nav" id="myTab">
            <li className="active"><a href="#values" data-toggle="tab">Our Values</a></li>
            <li><a href="#founders" data-toggle="tab">Robert &amp; Florence</a></li>
            <li><a className="staff" href="#staff" data-toggle="tab">Directors &amp; Staff</a></li>
          </ul>
        </div>

        <div className="tab-content col-xs-12 col-sm-10">

          { React.createElement(RouteHandler, ourValues) }

        </div>

      </div>
    </div>

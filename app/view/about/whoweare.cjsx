React = require 'react'
{RouteHandler, State} = require 'react-router'

Tab = require './tab'
TabStaff = require './tabStaff'

module.exports = React.createClass
  mixins: [State]
  render: ->
    {formTitle, areweagoodfit} = @props.whoweare
    tabId = @getParams().tabId or 'our-values'
    tabProps = @props.whoweare[tabId]

    if tabId is 'bios'
      {fellows, directors, staff} = tabProps
      directors.title = "Directors"
      fellows.title = "Fellows"
      staff.title = "Staff"
      tabEl =
        <article className>
          { React.createElement(TabStaff, directors) }
          { React.createElement(TabStaff, staff) }
          { React.createElement(TabStaff, fellows) }
        </article>
    else
      tabEl = React.createElement(RouteHandler, tabProps)

    <div className="row">
      <div className="tabbable">

        <div className="col-xs-12 col-sm-2">
          <ul className="side-nav" id="myTab">
            <li className="active"><a href="#whoweare/our-values" data-toggle="tab">Our Values</a></li>
            <li><a href="#whoweare/robert-florence" data-toggle="tab">Robert &amp; Florence</a></li>
            <li><a className="staff" href="#whoweare/bios" data-toggle="tab">Directors &amp; Staff</a></li>
          </ul>
        </div>

        <div className="tab-content col-xs-12 col-sm-10">
          { tabEl }
        </div>

      </div>
    </div>

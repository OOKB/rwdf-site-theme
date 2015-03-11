React = require 'react'
{RouteHandler, State, Link} = require 'react-router'

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
            <li className="active"><Link to="/whoweare/our-values" data-toggle="tab">Our Values</Link></li>
            <li><Link to="/whoweare/robert-florence" data-toggle="tab">Robert &amp; Florence</Link></li>
            <li><Link className="staff" to="/whoweare/bios" data-toggle="tab">Directors &amp; Staff</Link></li>
          </ul>
        </div>

        <div className="tab-content col-xs-12 col-sm-10">
          { tabEl }
        </div>

      </div>
    </div>

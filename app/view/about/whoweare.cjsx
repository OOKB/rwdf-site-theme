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

    tabIds = [
      {id: 'our-values', title: 'Our Values'}
      {id: 'robert-florence', title: "Robert & Florence"}
      {id: 'bios', title: "Directors & Staff"}
    ]

    <div className="row">
      <div className="tabbable">

        <div className="col-xs-12 col-sm-2">
          <ul className="side-nav" id="myTab">
            {
              tabIds.map (tabData) =>
                url = '/whoweare/'+tabData.id
                <li key={tabData.id} className={if @isActive(url) then 'active' else ''}>
                  <Link to={url} data-toggle="tab">{tabData.title}</Link>
                </li>
            }
          </ul>
        </div>

        <div className="tab-content col-xs-12 col-sm-10">
          { tabEl }
        </div>

      </div>
    </div>

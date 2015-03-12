React = require 'react'
{Link} = require 'react-router'
_ = require 'lodash'

module.exports = React.createClass
  getInitialState: ->
    index: 0
    show: false

  handleClick: (i) ->
    (e) =>
      e.preventDefault()
      @setState index: i

  handleTitleClick: (e) ->
    e.preventDefault()
    @setState show: !@state.show

  render: ->
    {contents} = @props
    {index, show} = @state
    {tabid, title, image, content} = contents[index]
    # Unless it is a full url assume it is the filename within the spruceup-grants dir.
    unless 'http' is image.slice(0,4)
      image = 'http://db.rwdfoundation.org/whatwedo/projects/spruceup-grants/'+image+'?size=l'
    if show
      toggleEl = false
    else
      toggleEl = <span className="togglearrow">&#8595;</span>

    <div>
      <h3 className="spruceuptitle">
        <a href='#' onClick={@handleTitleClick}>
          Grant Recipients
          {toggleEl}
        </a>
      </h3>
      {
        if show
          <div className="tabbable spruceuptabs row">
            <div className="spruceuplist col-xs-12 col-sm-4" id="myTab">
              <ul className="side-nav">
                {
                  contents.map (item, i) =>
                    <li key={item.tabid} className={if @state.index is i then 'active' else ''}>
                      <a href='#' onClick={@handleClick(i)}> { item.title } </a>
                    </li>
                }
              </ul>
            </div>

            <div className="tab-content col-xs-12 col-sm-8">
              <div className="tab-pane active" id={"tab-"+tabid}>
                <div className="">
                  <div className="clearfix leadimage">
                    <img className="col-xs-12 col-sm-8 offset2" src={ image } />
                  </div>
                  <h3>{ title }</h3>
                  <div dangerouslySetInnerHTML={ __html: content } />
                </div>
              </div>
            </div>
          </div>
        else
          false
      }
    </div>

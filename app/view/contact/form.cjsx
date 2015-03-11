React = require 'react'

module.exports = React.createClass
  render: ->
    {formTitle} = @props
    title7 = "How are you and your idea aligned with Deutsch's values and interests?"

    <div id="aboutyou_form" className="col-xs-12 col-md-7">
      <h3>{formTitle}</h3>
      <form id="form2" name="form2" className="wufoo topLabel page" autoComplete="off" encType="multipart/form-data" method="post" noValidate action="https://ookb.wufoo.com/forms/m7x3z9/#public">
        <div className="row">
          <div className="col-xs-12 col-md-6">
            <label className="desc" id="title10" htmlFor="Field10"> Your Name </label>
            <input id="Field2" name="Field2" type="text" className="field text" placeholder="Your Name" maxLength={255} tabIndex={1} onkeyup />
          </div>
          <div className="clearfix visible-xs visible-sm" />
          <div className="col-xs-12 col-md-6">
            <label className="desc" id="title10" htmlFor="Field10"> Your Organization</label>
            <input id="Field3" name="Field3" type="text" className="field text" placeholder="Organization Name" maxLength={255} tabIndex={2} onkeyup />
          </div>
        </div>
        <div className="row">
          <div id="foli10" className="phone col-xs-12 col-md-4">
            <label className="desc" id="title10" htmlFor="Field10"> Phone Number </label>
            <input id="Field10" name="Field10" type="tel" className="field text three" placeholder="###" size={3} maxLength={3} tabIndex={3} />
            <span className="symbol one">-</span>
            <input id="Field10-1" name="Field10-1" type="tel" className="field text three" placeholder="###" size={3} maxLength={3} tabIndex={4} />
            <span className="symbol one">-</span>
            <input id="Field10-2" name="Field10-2" type="tel" className="field text four" placeholder="####" size={4} maxLength={4} tabIndex={5} />
          </div>
          <div className="clearfix visible-xs visible-sm" />
          <div className="col-xs-12 col-md-8">
            <label className="desc" id="title10" htmlFor="Field10"> Your Email </label>
            <input id="Field9" name="Field9" type="email" spellCheck="false" className="field text medium" placeholder="youremail@email.com" maxLength={255} tabIndex={6} />
          </div>
        </div>
        <div className="row">
          <div className="col-xs-12">
            <label className="desc" id="title5" htmlFor="Field5"> Describe your idea or program </label>
            <textarea id="Field5" name="Field5" className="field textarea medium" spellCheck="true" rows={5} tabIndex={7} onkeyup />
          </div>
        </div>
        <div className="row">
          <div className="col-xs-12">
            <label className="desc" id="title6" htmlFor="Field6">Describe your organization (or yourself)</label>
            <textarea id="Field6" name="Field6" className="field textarea medium" spellCheck="true" rows={5} tabIndex={8} onkeyup />
          </div>
        </div>
        <div className="row">
          <div className="col-xs-12">
            <label className="desc" id="title7" htmlFor="Field7">{title7}</label>
            <textarea id="Field7" name="Field7" className="field textarea medium" spellCheck="true" rows={5} tabIndex={9} onkeyup />
          </div>
        </div>
        <div className="row">
          <div className="col-xs-12">
            <input id="saveForm" name="saveForm" className="btTxt submit" type="submit" defaultValue="Submit" />
          </div>
        </div>
        <div className="hide">
          <label htmlFor="comment">Do Not Fill This Out</label>
          <textarea name="comment" id="comment" rows={1} cols={1} />
          <input type="hidden" id="idstamp" name="idstamp" defaultValue="1DWtsf2ozTiUxBfVTEN9g4JOkzmbuCa1BDGxFxU9xlw=" />
        </div>
      </form>
    </div>

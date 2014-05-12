$(document).ready(function() {
  var hash = window.location.hash;
  var thanks_html = $('#thankyou_message');
  var hed_html = $('#page_hed');
  var body_html = $('#aboutyou_form');
  var thanks_shown = false;

  var show_thanks = function() {
    hash = window.location.hash;
    if ('#thanks' == hash) {
      console.log('show thanks');
      thanks_html.show();
      hed_html.hide();
      body_html.hide();
      thanks_shown = true;
    }
    else if (thanks_shown) {
      console.log('hide thanks');
      thanks_html.hide();
      hed_html.show();
      body_html.show();
      thanks_shown = false;
    }
    else {
      console.log(hash);
    }
  }

  window.onhashchange = show_thanks;

  show_thanks();

});

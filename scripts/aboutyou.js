$(document).ready(function() {
  var hash = window.location.hash;
  var hash_html = $('div#thankyou_message');
  var thanks_shown = false;
  var show_thanks = function() {
    if ('#thanks' == hash) {
      console.log('thanks');
      hash_html.show();
    }
    else if (thanks_shown) {
      hash_html.hide();
      thanks_shown = false;
    }
  }
  if ("onhashchange" in window) {
    hash = window.location.hash;
    show_thanks();
  }
  show_thanks();
});

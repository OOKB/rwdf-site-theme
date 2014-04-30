//trying to make the href location and tabs play along a little better...

$("#myTab li a").on("click", function(e) {
  e.preventDefault();
  var id = $(this).attr("href");
  window.location.hash = id;
  history.pushState(null, null, e.href);
  $(this).tab('show');
});

// on load of the page: switch to the currently selected tab
$(window).bind("load", function() {
  var hashy = window.location.hash;
  if (location.hash) {
    console.log(hashy);
    history.pushState(null, null, hashy);
    $.scrollTo(0, 0);
    $('#myTab li a[href="' + hashy + '"]').tab('show');
  }
});


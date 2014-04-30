//trying to make the href location and tabs play along a little better...

$("#myTab li a").on("click", function(e) {
  e.preventDefault();
  var id = $(this).attr("href");
  window.location.hash = id;
  history.pushState(null, null, e.href);
  $(this).tab('show');
});

// on load of the page: switch to the currently selected tab
$(window).load(function(e) {
  e.preventDefault();
  history.pushState(null, null, window.location.hash);
  $('#myTab li a[href="' + window.location.hash + '"]').tab('show');
});

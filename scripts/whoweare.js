//trying to make the href location and tabs play along a little better...

$("#myTab li a").on("click", function(e) {
  e.preventDefault();
  var id = $(this).attr("href");
  window.location.hash = id;
  history.pushState(null, null, e.href);
  $(this).tab('show');
});

// on load of the page: switch to the currently selected tab
if (window.location.hash) {
  $(window).scrollTop(0);
  $('#myTab li a[href="' + window.location.hash + '"]').tab('show');
  console.log(window.location.hash);
}

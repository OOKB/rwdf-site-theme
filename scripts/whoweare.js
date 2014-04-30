//trying to make the href location and tabs play along a little better...

$("#myTab li a").on("click", function(e) {
  e.preventDefault();
  $(this).tab('show');
  var id = $(this).attr("href");
  window.location.hash = id;
});

// on load of the page: switch to the currently selected tab
var hash = window.location.hash;
history.pushState(null, null, hash);
$('#myTab li a[href="' + hash + '"]').tab('show');

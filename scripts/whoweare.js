//trying to make the href location and tabs play along a little better...

$("#myTab li a").on("click", function(e) {
  e.preventDefault();
  $(this).tab('show');
  history.pushState({}, "", this.href);
});

// on load of the page: switch to the currently selected tab
var hash = window.location.hash;
$('#myTab li a[href="' + hash + '"]').tab('show');


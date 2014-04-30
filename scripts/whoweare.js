//trying to make the href location and tabs play along a little better...

// store the currently selected tab in the hash value
$("#myTab li a").on("shown.bs.tab", function (e) {
  var id = $(e.target).attr("href").substr(1);
  window.location.hash = id;
});

// on load of the page: switch to the currently selected tab
var hash = window.location.hash;
$('#myTab li a[href="' + hash + '"]').tab('show');

/*
$('#myTab li a').click(function(){
  var href = $(this).attr('href');
});
*/


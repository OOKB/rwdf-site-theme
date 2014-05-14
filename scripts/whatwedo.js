//Working on making sidebar navigation follow active trail.
$(document).ready(function() {

  // properly sets active side-bar link
  
  $("#filters a").click(function() {
    $("#filters").find('li.active').removeClass('active');
    $(this).parent().parent().addClass('active');
  });
  
  $('#projects .icons.categories a').click(function(){
    var href = $(this).attr('href');
    $("#filters").find('li.active').removeClass('active');
    $("#filters").find('a[href="' + href + '"]').parent().parent().addClass('active');
  });
  
  //sets href for the isotope filters...
  $('.icons.categories .science a').attr('href', '#filter=.science');
  $('.icons.categories .scholars a').attr('href', '#filter=.scholars');
  $('.icons.categories .arts a').attr('href', '#filter=.arts');
  $('.icons.categories .justice a').attr('href', '#filter=.justice');
  $('.icons.categories .community a').attr('href', '#filter=.community');

  $('#projects').isotope({ layoutMode : 'fitRows' });

});

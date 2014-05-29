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
  $('.icons.categories .education a').attr('href', '#filter=.education');
  $('.icons.categories .arts a').attr('href', '#filter=.arts');
  $('.icons.categories .justice a').attr('href', '#filter=.justice');
  $('.icons.categories .community a').attr('href', '#filter=.community');

  $('#projects').isotope({ layoutMode : 'fitRows' });

  //hmmm i deleted this, and it stopped working, then I put it back and it still isn't working... feck.
  $('#filters a').click(function(){
    // get href attr, remove leading #
    var href = $(this).attr('href').replace( /^#/, '' ),
        // convert href into object
        // i.e. 'filter=.inner-transition' -> { filter: '.inner-transition' }
        option = $.deparam( href, true );
    // set hash, triggers hashchange on window
    $.bbq.pushState( option );
    return false;
  });

  $('#projects .icons.categories a').click(function(){
    // get href attr, remove leading #
    var href = $(this).attr('href').replace( /^#/, '' ),
        // convert href into object
        // i.e. 'filter=.inner-transition' -> { filter: '.inner-transition' }
        option = $.deparam( href, true );
    // set hash, triggers hashchange on window
    $.bbq.pushState( option );
    return false;
  });

  $(window).bind( 'hashchange', function( event ){
    // get options object from hash
    var hashOptions = $.deparam.fragment();
    // apply options from hash
    $('#projects').isotope( hashOptions );
  })

  // trigger hashchange to capture any hash data on init
  .trigger('hashchange');
  
  //the end

});

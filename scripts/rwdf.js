$(document).ready(function() {
  //prepare whatwedo feed for isotope...
  $('.icons.categories .science a').attr('href', '#filter=.science');
  $('.icons.categories .scholars a').attr('href', '#filter=.scholars');
  $('.icons.categories .arts a').attr('href', '#filter=.arts');
  $('.icons.categories .justice a').attr('href', '#filter=.justice');
  $('.icons.categories .community a').attr('href', '#filter=.community');

  $('.icons.categories a.science').attr('href', '/whatwedo/#filter=.science');
  $('.icons.categories a.scholars').attr('href', '/whatwedo/#filter=.scholars');
  $('.icons.categories a.arts').attr('href', '/whatwedo/#filter=.arts');
  $('.icons.categories a.justice').attr('href', '/whatwedo/#filter=.justice');
  $('.icons.categories a.community').attr('href', '/whatwedo/#filter=.community');

  var $container = $('#projects');
  $container.isotope({ layoutMode : 'fitRows' });

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
    $container.isotope( hashOptions );
  })
  // trigger hashchange to capture any hash data on init
  .trigger('hashchange');

});

$(document).ready(function() {
  var ww = $(window).width();
  var wh = $(window).height();

  if (ww >= 767) {// set slideshow height cleverly
    $('#slideshow').height(wh-400);
    $('#slideshow .slide').height(wh-400);
  } else {
    $('#slideshow').height(200);
    $('#slideshow .slide').css('height','100%');
  }

});

$(window).resize(function() {
  var ww = $(window).width();
  var wh = $(window).height();

  if (ww >= 767) {// set slideshow height cleverly
    $('#slideshow').height(wh-400);
    $('#slideshow .slide').height(wh-400);
  } else {
    $('#slideshow').height(200);
    $('#slideshow .slide').css('height','100%');
  }
  
});

$(window).bind("load", function() {
  // subtract height of projects so prev/next buttons show up in right places
  var projectheight = $('.row.project').height();
  var btnheight     = projectheight+60;
  var relpos        = (projectheight-60)*-1;
  $('.controls div a').css('top',relpos);
  $('.controls div a').height(btnheight);
  
  $('.spruceuptabs .spruceuplist ul li').first().addClass('active');
  $('.spruceuptabs .tab-content > div.tab-pane').first().addClass('active');
});

//Working on making sidebar navigation follow active trail.
$("#filters a").click(function() {
  $("#filters").find('li.active').removeClass('active');
  $(this).parent().parent().addClass('active');
});

// FancyBox
$(document).ready(function() {
  $('.fancybox').fancybox();
});

// spruceup box behaviors
$(document).ready(function() {
  $('.spruceuptabs').hide();
  $('.spruceuptitle').click(function() {
    $('span.togglearrow').toggle('slow');
    $('.spruceuptabs').toggle('slow', function() {
      // subtract height of projects so prev/next buttons show up in right places
      var projectheight = $('.row.project').height();
      var btnheight     = projectheight+60;
      var relpos        = (projectheight-60)*-1;
      $('.controls div a').css('top',relpos);
      $('.controls div a').height(btnheight);
    });
  });
});

// store the currently selected tab in the hash value
$("ul.nav-tabs > li > a").on("shown.bs.tab", function (e) {
    var id = $(e.target).attr("href").substr(1);
    window.location.hash = id;
});

// on load of the page: switch to the currently selected tab
var hash = window.location.hash;
$('#myTab a[href="' + hash + '"]').tab('show');

////////////////////


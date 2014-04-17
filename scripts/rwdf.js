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
  var containerheight = $('.container.inner').height();
  var btnheight     = containerheight+30;
  var relpos        = (containerheight-30)*-1;
  $('.minus-top .pager a').css('top',relpos);
  $('.minus-top .pager a').height(btnheight);
  
  $('.spruceuptabs .spruceuplist ul li').first().addClass('active');
  $('.spruceuptabs .tab-content > div.tab-pane').first().addClass('active');
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
      var containerheight = $('.container.inner').height();
      var btnheight     = containerheight+30;
      var relpos        = (containerheight-30)*-1;
      $('.minus-top .pager a').css('top',relpos);
      $('.minus-top .pager a').height(btnheight);
      
    });
  });
});

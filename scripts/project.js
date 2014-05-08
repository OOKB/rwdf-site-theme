$(document).ready(function() {
  //prepare whatwedo feed for isotope...
  $('.icons.categories a.science').attr('href', '/whatwedo/#filter=.science');
  $('.icons.categories a.scholars').attr('href', '/whatwedo/#filter=.scholars');
  $('.icons.categories a.arts').attr('href', '/whatwedo/#filter=.arts');
  $('.icons.categories a.justice').attr('href', '/whatwedo/#filter=.justice');
  $('.icons.categories a.community').attr('href', '/whatwedo/#filter=.community');

  // spruceup box behaviors
  $('.spruceuptabs').hide();
  $('.spruceuptitle').click(function() {
    $('span.togglearrow').toggle('slow');
    $('.spruceuptabs').toggle('slow', function() {
      // subtract height of projects so prev/next buttons show up in right places
      var projectheight = $('.row.project').height();
      var btnheight     = projectheight+60;
      var relpos        = (projectheight)*-1;
      $('.controls div a').css('top',relpos);
      $('.controls div a').height(btnheight);
    });
  });

  $("#img-carousel div.item:nth-child(1)").addClass("active");

});

$(window).bind("load", function() {
  // subtract height of projects so prev/next buttons show up in right places
  var projectheight = $('.row.project').height();
  var btnheight     = projectheight+60;
  var relpos        = (projectheight)*-1;
  $('.controls div a').css('top',relpos);
  $('.controls div a').height(btnheight);

  $('.spruceuptabs .spruceuplist ul li').first().addClass('active');
  $('.spruceuptabs .tab-content > div.tab-pane').first().addClass('active');
});


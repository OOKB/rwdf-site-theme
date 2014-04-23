$(document).ready(function() {
  var endpoint = '/whatwedo/projects.json';
  $.getJSON(endpoint, function(data) {
    var template = Hogan.compile($('#projects-template').html());
    $('div#projects').append(template.render(data));
  });
});

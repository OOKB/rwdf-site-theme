window.log = function() {
  window.console && window.console.log && window.console.log.apply(window.console, arguments);
};

$(document).ready(function() {
  var endpoint = '/whatwedo/projects.json';
  $.getJSON(endpoint, function(data) {
    // Assign template from html. Script tag with id.
    var template = Hogan.compile($('#projects-template').html());
    // Render and add to html in one step.
    $('div#projects').append(template.render(data));
  });
});

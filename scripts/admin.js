window.log = function() {
  window.console && window.console.log && window.console.log.apply(window.console, arguments);
};

$(document).ready(function() {
  var endpoint = '/whatwedo/projects.json';
  $.getJSON(endpoint, function(data) {
    _.forEach(data.projects, function(project){
      if (project.image && !project.featureimg) {
        project.featureimg = project.image;
      }
    });
    // Assign template from html. Script tag with id.
    var template = Hogan.compile($('#projects-template').html());
    // Render and add to html in one step.
    $('div#projects').append(template.render(data));
    var list = document.getElementById("project-list");
    var sorted = function(evt){
      var obj = { entity: {} };
      // Collect the order of the items and build an object
      $('ul#project-list > li').each(function(i) {
        var id = $(this).attr('id');
        var position = i+1;
        if (position < 50) {
          obj.entity[id] = position;
        }
      });
      $.ajax({
        url: '/_api/content/_index/list/homepage',
        type: 'PUT',
        data: JSON.stringify(obj),
        headers: { Authorization: 'bearer 1demo69231642511demo51589525777684849721335713456018032661191234' },
        contentType: 'application/json',
        success: function(result) {
          console.log(result);
          // Now tell cape to reprocess the views. This is horrible.
          $.getJSON('/_view/_all/_output', function(data){console.log(data)});
        },
        fail: function(result) {
          console.log(result);
        }
      });
      console.log(obj);
    };
    new Sortable(list, {onUpdate: sorted});
    console.log('list');
  });
});

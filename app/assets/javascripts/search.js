$(document).on('turbolinks:load', function() {
    $.ajax({
      url: "/relatives",
      dataType: 'JSON',
      success: function(data){
        $("#search").autocomplete({
            source: data
        });
      }
    });
});

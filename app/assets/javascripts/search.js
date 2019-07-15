$(document).on('turbolinks:load', function() {
    $.ajax({
      url: "/users",
      dataType: 'JSON',
      success: function(data){
        $("#search").autocomplete({
          // max: 10,
          source: data
        });
      }
    });
});

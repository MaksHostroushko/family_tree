$(document).on('turbolinks:load', function() {
  $(".button-show-categories").click(function(){
    $("#relatives_category_id").toggleClass('form-collaborators');
  });
});

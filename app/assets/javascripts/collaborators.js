$(document).on('turbolinks:load', function() {
  $('#btn_collab').click(function() {
    $('#form-all-collab').toggleClass('form-collaborators');
  })
})

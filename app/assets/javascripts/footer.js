$(document).on('turbolinks:load', function() {
  let docHeight = $(window).height();
  let footerHeight = $('.footer').height();
  let footerTop = $('.footer').position().top + footerHeight;

  if (footerTop < docHeight) {
    $(".footer").addClass('fixed-bottom container-fluid col-12');
  }
});

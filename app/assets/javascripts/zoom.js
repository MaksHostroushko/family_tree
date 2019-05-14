$(document).on('turbolinks:load', function(){
  setInterval(checkZoom, 100);
})
function checkZoom() {
  let browserZoomLevel = Math.round(window.devicePixelRatio * 100);
  if (browserZoomLevel >= 90 && browserZoomLevel <= 100) {
    $('.navbar-link-all-users').addClass("search-margin-1")
    $('.navbar-link-all-users').removeClass("search-margin-2")
    $('.navbar-link-all-users').removeClass("search-margin-3")
    $('#navbarDropdown').removeClass("nav_name_2");
  } else if (browserZoomLevel > 100 && browserZoomLevel <= 110) {
    $('.navbar-link-all-users').addClass("search-margin-2")
    $('.navbar-link-all-users').removeClass("search-margin-1")
    $('.navbar-link-all-users').removeClass("search-margin-3")
    $('#navbarDropdown').removeClass("nav_name");
    $('#navbarDropdown').removeClass("nav_name_2");
  } else if (browserZoomLevel > 110) {
    $('.navbar-link-all-users').addClass("search-margin-3")
    $('.navbar-link-all-users').removeClass("search-margin-1")
    $('.navbar-link-all-users').removeClass("search-margin-2")
    $('#navbarDropdown').removeClass("nav_name");
    $('#navbarDropdown').addClass("nav_name_2");
  }
};

$(document).on('turbolinks:load', function checkZoom() {
  let browserZoomLevel = Math.round(window.devicePixelRatio * 100);

  if (browserZoomLevel >= 90 && browserZoomLevel <= 100) {
    $('#search').removeClass("ui-autocomplete-input");
    $('#search').addClass("ui-autocomplete-input-2");
  } else if (browserZoomLevel > 100 && browserZoomLevel <= 110) {
    $('#search').removeClass("ui-autocomplete-input-2");
    $('#search').addClass("ui-autocomplete-input-3");
  } else if (browserZoomLevel > 110) {
    $('#search').removeClass("ui-autocomplete-input-3");
    $('#search').addClass("ui-autocomplete-input-4");
  }
  setInterval(checkZoom, 100);
  });

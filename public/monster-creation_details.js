function SetupLoading() {
  $('a[data-toggle="tab"]').on('shown.bs.tab', function(e) {
    if($(e.target).attr('href') == "#details") {
      // Do the thing
    }
  })
}

$(document).ready(function() {
  SetupLoading()
});

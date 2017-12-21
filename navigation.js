function ShowOrHideNextSubmit() {
  var current = $(".nav-tabs > .nav-item > .active").parent()

  if(current.is($("#navTabs > .nav-item").last())) {
    $("#btnPrevious").prop("disabled", false);
    $("#btnNext").hide();
    $("#btnSubmit").show();
  }
  else if(current.is($("#navTabs > .nav-item").first())) {
    console.log("beep");
    $("#btnPrevious").prop("disabled", true);
    $("#btnNext").show();
    $("#btnSubmit").hide();
  }
  else {
    $("#btnPrevious").prop("disabled", false);
    $("#btnNext").show();
    $("#btnSubmit").hide();
  }
}

$(document).ready(function(){
  // Event setup
  $("#btnPrevious").click(function(){
    $("#navTabs > .nav-item > .active").parent().prev("li").find("a").trigger("click");
  });
  $("#btnNext").click(function(){
    $("#navTabs > .nav-item > .active").parent().next("li").find("a").trigger("click");
  });
  $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
    ShowOrHideNextSubmit();
  });

  // Page setup
  ShowOrHideNextSubmit();
});

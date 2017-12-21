$(document).ready(function(){
  $("#btnPrevious").click(function(){
    $(".nav-tabs > .nav-item > .active").parent().prev("li").find("a").trigger("click");
  });
  $("#btnNext").click(function(){
    $(".nav-tabs > .nav-item > .active").parent().next("li").find("a").trigger("click");
  });
});

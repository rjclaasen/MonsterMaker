function LoadData(){
  var url = "http://localhost:8000/traits.json";
  $.getJSON(url, function(data) {
    console.log("loadDone");
    $.each(data, function(){
      console.log("bip");
      $("<option/>", {
        "value": this.id,
        "text": this.name
      }).appendTo("#traitsSelect");
    });
  });
}

$(document).ready(function(){
  LoadData();
});

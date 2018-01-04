var jsonData;

function LoadData(){
  var url = "traits.json";
  $.getJSON(url, function(data) {
    jsonData = data;

    $.each(jsonData, function(){
      $("<option/>", {
        "value": this.id,
        "text": this.name
      }).appendTo("#traitsSelect");
    });

    SetupSelectOptionEffects();
  });
}

function SetupSelectOptionEffects(){
  var traitsSelect = $("#traitsSelect");
  var exampleMonsterText = $("#exampleMonsterText");
  var crEffectText = $("#crEffectText");

  traitsSelect.on("change", function() {
    var exampleMonster = "Vortigaunt"
    var crEffect = "None."
    var valueSelected = this.value;

    var matchingJsonObject = $.grep(jsonData, function(obj){return obj.id == valueSelected;})[0];
    exampleMonster = matchingJsonObject.exampleMonster;
    crEffect = matchingJsonObject.crEffect;

    exampleMonsterText.val(exampleMonster);
    crEffectText.text(crEffect);
  });
}

$(document).ready(function(){
  LoadData();
});

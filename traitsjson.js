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
  var traitDescriptionText = $("#traitDescriptionText");

  traitsSelect.on("change", function() {
    var exampleMonster = "Vortigaunt"
    var crEffect = "None."
    var traitDescription = "None."
    var valueSelected = this.value;

    var matchingJsonObject = $.grep(jsonData, function(obj){return obj.id == valueSelected;})[0];
    exampleMonster = matchingJsonObject.exampleMonster;
    crEffect = matchingJsonObject.crEffect;
    traitDescription = matchingJsonObject.traitDescription;

    exampleMonsterText.val(exampleMonster);
    crEffectText.text(crEffect);
    if(traitDescription != null) {
      traitDescriptionText.text(traitDescription); //TODO: Ensure markup can be used to highlight spell names, recharge times, etc.
    } else {
      traitDescriptionText.text("== Not yet implemented ==");
    }
  });
}

$(document).ready(function(){
  LoadData();
});

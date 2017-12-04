function setupChallengeRatings() {
  var crTextBox = $("#crTextBox");
  var ocrTextBox = $("#ocrTextBox");
  var dcrTextBox = $("#dcrTextBox");

  var oldBaseCR = parseInt(crTextBox.val());
  var newBaseCR = oldBaseCR;

  crTextBox.on('input', function() {
    oldBaseCR = newBaseCR;
    newBaseCR = parseInt($(this).val());
    var dCR = newBaseCR - oldBaseCR;

    if(!(isNaN(parseInt(ocrTextBox.val())))) {
      ocrTextBox.val(parseInt(ocrTextBox.val()) + dCR);
    } else {
      ocrTextBox.val(newBaseCR);
    }
    if(!isNaN(parseInt(dcrTextBox.val()))) {
      dcrTextBox.val(parseInt(dcrTextBox.val()) + dCR);
    } else {
      dcrTextBox.val(newBaseCR);
    }
  });
}

$(document).ready(function() {
  setupChallengeRatings();
});

function setupSizeChoiceEffects() {
  var sizeSelect = $("#sizeSelect");
  var numDiceFromSizeText = $("#numDiceFromSizeText");
  var hitDieSize = $("#hitDieSize");

  sizeSelect.on('change', function() {
    var numDice = "1"; // This is a string because gargantuan can have 4 or more.
    var hitDie = "d8";
    var valueSelected = this.value;

    switch(valueSelected) {
      case "tiny":
        numDice = "1";
        hitDie = "d4";
        break;
      case "small":
        numDice = "1";
        hitDie = "d6";
        break;
      case "medium":
        numDice = "1";
        hitDie = "d8";
        break;
      case "large":
        numDice = "2";
        hitDie = "d10";
        break;
      case "huge":
        numDice = "3";
        hitDie = "d12";
        break;
      case "gargantuan":
        numDice = "4";
        hitDie = "d20";
        break;
    }

    numDiceFromSizeText.text(numDice);
    hitDieSize.text(hitDie);
  });
}

function setupChallengeRatings() {
  var crTextBox = $("#crTextBox");
  var ocrTextBox = $("#ocrTextBox");
  var dcrTextBox = $("#dcrTextBox");

  var ocr = parseInt(ocrTextBox.val());
  var dcr = parseInt(dcrTextBox.val());
  var cr = parseInt(crTextBox.val());

  var docr = ocr - cr;
  var ddcr = dcr - cr;

  var oldCR = cr;

  // On CR textbox change.
  crTextBox.on('input', function() {
    cr = parseInt($(this).val());

    ocr = cr + docr;
    ocrTextBox.val(ocr);
    dcr = cr + ddcr;
    dcrTextBox.val(dcr);
  });

  // On Offensive CR textbox change.
  ocrTextBox.on('input', function() {
    ocr = parseInt($(this).val());

    cr = (ocr + dcr) / 2;
    docr = ocr - cr;
    ddcr = dcr - cr;
    crTextBox.val(cr);
  });

  // On Defensive CR textbox change.
  dcrTextBox.on('input', function() {
    dcr = parseInt($(this).val());

    cr = (ocr + dcr) / 2;
    docr = ocr - cr;
    ddcr = dcr - cr;
    crTextBox.val(cr);
  });
}

function setupTooltips() {
  $('[data-toggle="tooltip"]').tooltip();
}

$(document).ready(function() {
  setupSizeChoiceEffects();
  setupChallengeRatings();
  setupTooltips();
});

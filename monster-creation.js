var ocr;
var dcr;
var cr;

function setupChallengeRatings() {
  var crTextBox = $("#crTextBox");
  var ocrTextBox = $("#ocrTextBox");
  var dcrTextBox = $("#dcrTextBox");

  ocr = parseInt(ocrTextBox.val());
  dcr = parseInt(dcrTextBox.val());
  cr = parseInt(crTextBox.val());

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

$(document).ready(function() {
  setupChallengeRatings();
});

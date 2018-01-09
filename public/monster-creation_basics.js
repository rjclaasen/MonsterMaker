function setupSizeChoiceEffects() {
  var sizeSelect = $("#sizeSelect");
  var numDiceFromSizeText = $("#numDiceFromSizeText");
  var hitDieSize = $("#hitDieSize");

  sizeSelect.on("change", function() {
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

function setProficiencyBonusFromCR(cr) {
  var profBonusTextBox_basics = $("#proficiencyText_basics");
  var profText = "+" + CRtoProf(cr);

  profBonusTextBox_basics.val(profText);
}

function setACFromDefCR(dcr) {
  var acTextBox_basics = $("#armorclassText_basics");
  var ac = CRtoAC(dcr);

  acTextBox_basics.val(ac);
}

function setHPFromDefCR(dcr) {
  var hpTextBox_basics = $("#hitpointsText_basics");
  var hpObj = CRtoHP(dcr);
  var minHP = hpObj.minHP;
  var maxHP = hpObj.maxHP;

  var hp = minHP + "-" + maxHP;

  hpTextBox_basics.val(hp);
}

function setAtkBonusFromOffCR(ocr) {
  var atkBonusTextBox_basics = $("#atkText_basics");
  var atkText = "+" + CRtoAtk(ocr)

  atkBonusTextBox_basics.val(atkText);
}

function setDmgPerRoundFromOffCR(ocr) {
  var dmgTextBox_basics = $("#dmgText_basics");
  var dprObj = CRtoDPR(ocr);
  var minDpr = dprObj.minDpr;
  var maxDpr = dprObj.maxDpr;

  var dpr = minDpr + "-" + maxDpr;

  dmgTextBox_basics.val(dpr);
}

function setSaveDCFromOffCR(ocr) {
  var saveDCTextBox_basics = $("#dcText_basics");
  var saveDC = CRtoSaveDC(ocr);

  saveDCTextBox_basics.val(saveDC);
}

function setXPFromCR(cr) {
  var xpTextBox_basics = $("#xpReward_basics");
  var xp = CRtoXP(cr).toLocaleString();

  xpTextBox_basics.text(xp);
}

function setupChallengeRatings() {
  var crTextBox = $("#crTextBox_basics");
  var ocrTextBox = $("#ocrTextBox_basics");
  var dcrTextBox = $("#dcrTextBox_basics");

  var ocr = parseInt(ocrTextBox.val());
  var dcr = parseInt(dcrTextBox.val());
  var cr = parseInt(crTextBox.val());

  var docr = ocr - cr;
  var ddcr = dcr - cr;

  var oldCR = cr;

  ShowHideCRRoundingTooltip = function() {
    if((ocr + dcr) / 2 != cr) {
      $("#crTextBoxTooltip_basics").show();
    } else {
      $("#crTextBoxTooltip_basics").hide();
    }
  };
  ShowHideCRRoundingTooltip();

  // On CR textbox change.
  crTextBox.on('input', function() {
    cr = parseInt($(this).val());
    if(isNaN(cr)) {
      cr = Math.floor((ocr + dcr) / 2);
      docr = ocr - cr;
      ddcr = dcr - cr;
      return;
    }

    ocr = cr + docr;
    ocrTextBox.val(ocr);
    dcr = cr + ddcr;
    dcrTextBox.val(dcr);

    ShowHideCRRoundingTooltip();

    setProficiencyBonusFromCR(cr);
    setACFromDefCR(dcr);
    setHPFromDefCR(dcr);
    setAtkBonusFromOffCR(ocr);
    setDmgPerRoundFromOffCR(ocr);
    setSaveDCFromOffCR(ocr);
    setXPFromCR(cr);
  });

  // On Offensive CR textbox change.
  ocrTextBox.on('input', function() {
    ocr = parseInt($(this).val());
    if(isNaN(ocr)) {
      ocr = 0;
      return;
    }

    cr = Math.floor((ocr + dcr) / 2);
    docr = ocr - cr;
    ddcr = dcr - cr;
    crTextBox.val(cr);

    ShowHideCRRoundingTooltip();

    setProficiencyBonusFromCR(cr);
    setACFromDefCR(dcr);
    setHPFromDefCR(dcr);
    setAtkBonusFromOffCR(ocr);
    setDmgPerRoundFromOffCR(ocr);
    setSaveDCFromOffCR(ocr);
    setXPFromCR(cr);
  });

  // On Defensive CR textbox change.
  dcrTextBox.on('input', function() {
    dcr = parseInt($(this).val());
    if(isNaN(dcr)) {
      dcr = 0;
      return;
    }

    cr = Math.floor((ocr + dcr) / 2);
    docr = ocr - cr;
    ddcr = dcr - cr;
    crTextBox.val(cr);

    ShowHideCRRoundingTooltip();

    setProficiencyBonusFromCR(cr);
    setACFromDefCR(dcr);
    setHPFromDefCR(dcr);
    setAtkBonusFromOffCR(ocr);
    setDmgPerRoundFromOffCR(ocr);
    setSaveDCFromOffCR(ocr);
    setXPFromCR(cr);
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

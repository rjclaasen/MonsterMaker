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
  var profBonusTextBox = $("#proficiencyText");
  var profText = "+"

  var prof = Math.floor((cr - 1) / 4) + 2;
  profText += prof;
  profBonusTextBox.val(profText);
}

function setACFromDefCR(dcr) {
  var acTextBox = $("#armorclassText");
  var ac = 13;

  if(dcr <= 3) {
    ac = 13; // 0 <= dcr <= 4
  } else if(dcr == 4) {
    ac = 14; // dcr == 4
  } else if(dcr <= 7) {
    ac = 15; // 6 <= dcr <= 7
  } else if(dcr <= 9) {
    ac = 16; // 8 <= dcr <= 9
  } else if(dcr <= 12) {
    ac = 17; // 10 <= dcr <= 12
  } else if(dcr <= 16) {
    ac = 18; // 13 <= dcr <= 16
  } else {
    ac = 19; // 17 <= dcr
  }

  acTextBox.val(ac);
}

function setHPFromDefCR(dcr) {
  var hpTextBox = $("#hitpointsText");
  var hp = "71-85";

  if(dcr == 0) {
    hp = "1-6";
  } else if(dcr <= 1/8) {
    hp = "7-35";
  } else if(dcr <= 1/4) {
    hp = "36-49";
  } else if(dcr <= 1/2) {
    hp = "50-70";
  } else if(dcr <= 19) {
    var minHP = 71 + (15 * (dcr - 1));
    var maxHP = 70 + (15 * dcr);
    hp = minHP + "-" + maxHP;
  } else { // 20 <= dcr
    var minHP = 356 + (45 * (dcr - 20));
    var maxHP = 355 + (45 * (dcr - 19));
    hp = minHP + "-" + maxHP;
  }

  hpTextBox.val(hp);
}

function setAtkBonusFromOffCR(ocr) {
  var atkBonusTextBox = $("#atkText");
  var atkText = "+"

  if(ocr <= 2) {
    atkText += 3;
  } else if(ocr == 3) {
    atkText += 4;
  } else if(ocr == 4) {
    atkText += 5;
  } else if(ocr <= 7) {
    atkText += 6;
  } else if(ocr <= 10) {
    atkText += 7;
  } else if(ocr <= 15) {
    atkText += 8;
  } else if(ocr == 16) {
    atkText += 9;
  } else if(ocr <= 20) {
    atkText += 10;
  } else if(ocr <= 23) {
    atkText += 11;
  } else if(ocr <= 26) {
    atkText += 12;
  } else if(ocr <= 29) {
    atkText += 13;
  } else { // ocr == 30
    atkText += 14;
  }

  atkBonusTextBox.val(atkText);
}

function setDmgPerRoundFromOffCR(ocr) {
  var dmgTextBox = $("#dmgText");
  var dmg = "9-14";

  if(ocr == 0) {
    dmg = "0-1";
  } else if(ocr == 1/8) {
    dmg = "2-3";
  } else if(ocr == 1/4) {
    dmg = "4-5";
  } else if(ocr == 1/2) {
    dmg = "6-8";
  } else if(ocr <= 19) {
    var minDmg = 9 + (6 * (ocr - 1));
    var maxDmg = 8 + (6 * ocr);
    dmg = minDmg + "-" + maxDmg;
  } else { // 20 <= ocr
    var minDmg = 123 + (18 * (ocr - 20));
    var maxDmg = 122 + (18 * (ocr - 19));
    dmg = minDmg + "-" + maxDmg;
  }

  dmgTextBox.val(dmg);
}

function setSaveDCFromOffCR(ocr) {
  var saveDCTextBox = $("#dcText");
  var saveDC = 13

  if(ocr <= 3) {
    saveDC = 13;
  } else if(ocr == 4) {
    saveDC = 14;
  } else if(ocr <= 7) {
    saveDC = 15;
  } else if(ocr <= 10) {
    saveDC = 16;
  } else if(ocr <= 12) {
    saveDC = 17;
  } else if(ocr <= 16) {
    saveDC = 18;
  } else if(ocr <= 20) {
    saveDC = 19;
  } else if(ocr <= 23) {
    saveDC = 20;
  } else if(ocr <= 26) {
    saveDC = 21;
  } else if(ocr <= 29) {
    saveDC = 22;
  } else { //ocr == 30
    saveDC = 23;
  }

  saveDCTextBox.val(saveDC);
}

function setXPFromCR(cr) {
  var xpTextBox = $("#xpReward");
  var xp = 200;

  if(cr == 0) {
    xp = "0 or 10";
  } else if(cr <= 1) {
    xp = 200 * cr; // Covers 1/8, 1/4, and 1/2 as well.
  } else {
    switch(cr) {
      case 2:
        xp = 450;
        break;
      case 3:
        xp = 700;
        break;
      case 4:
        xp = 1100;
        break;
      case 5:
        xp = 1800;
        break;
      case 6:
        xp = 2300;
        break;
      case 7:
        xp = 2900;
        break;
      case 8:
        xp = 3900;
        break;
      case 9:
        xp = 5000;
        break;
      case 10:
        xp = 5900;
        break;
      case 11:
        xp = 7200;
        break;
      case 12:
        xp = 8400;
        break;
      case 13:
        xp = 10000;
        break;
      case 14:
        xp = 11500;
        break;
      case 15:
        xp = 13000;
        break;
      case 16:
        xp = 15000;
        break;
      case 17:
        xp = 18000;
        break;
      case 18:
        xp = 20000;
        break;
      case 19:
        xp = 22000;
        break;
      case 20:
        xp = 25000;
        break;
      case 21:
        xp = 33000;
        break;
      case 22:
        xp = 41000;
        break;
      case 23:
        xp = 50000;
        break;
      case 24:
        xp = 62000;
        break;
      case 25:
        xp = 75000;
        break;
      case 26:
        xp = 90000;
        break;
      case 27:
        xp = 105000;
        break;
      case 28:
        xp = 120000;
        break;
      case 29:
        xp = 135000;
        break;
      case 30:
        xp = 155000;
        break;
      default:
        xp = "Not a valid CR for XP";
    }
  }

  xp = xp.toLocaleString();
  xpTextBox.text(xp);
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
    if(isNaN(cr)) {
      cr = (ocr + dcr) / 2;
      docr = ocr - cr;
      ddcr = dcr - cr;
      return;
    }

    ocr = cr + docr;
    ocrTextBox.val(ocr);
    dcr = cr + ddcr;
    dcrTextBox.val(dcr);

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

    cr = (ocr + dcr) / 2;
    docr = ocr - cr;
    ddcr = dcr - cr;
    crTextBox.val(cr);

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
    //console.log(isNaN(dcr));
    if(isNaN(dcr)) {
      dcr = 0;
      return;
    }

    cr = (ocr + dcr) / 2;
    docr = ocr - cr;
    ddcr = dcr - cr;
    crTextBox.val(cr);

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

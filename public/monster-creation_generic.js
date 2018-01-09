//////////////////////////////////////////////
// Contains all DMG table lookup functions. //
//////////////////////////////////////////////

function CRtoProf(cr) {
  return Math.floor((cr - 1) / 4) + 2;
}

function CRtoAC(cr) {
  if(cr <= 3) {
    return 13; // 0 <= dcr <= 4
  } else if(cr == 4) {
    return 14; // dcr == 4
  } else if(cr <= 7) {
    return 15; // 6 <= dcr <= 7
  } else if(cr <= 9) {
    return 16; // 8 <= dcr <= 9
  } else if(cr <= 12) {
    return 17; // 10 <= dcr <= 12
  } else if(cr <= 16) {
    return 18; // 13 <= dcr <= 16
  } else {
    return 19; // 17 <= dcr
  }
}

function CRtoHP(cr) {
  var minHP = 71; // Default for CR1
  var maxHP = 85; // ^

  if(cr == 0) {
    minHP = 1;
    maxHP = 6;
  } else if(cr <= 1/8) {
    minHP = 7;
    maxHP = 35;
  } else if(cr <= 1/4) {
    minHP = 36;
    maxHP = 49;
  } else if(cr <= 1/2) {
    minHP = 50;
    maxHP = 70;
  } else if(cr <= 19) {
    minHP = 71 + (15 * (cr - 1));
    maxHP = 70 + (15 * cr);
  } else { // 20 <= dcr
    minHP = 356 + (45 * (cr - 20));
    maxHP = 355 + (45 * (cr - 19));
  }

  return {
    minHP: minHP,
    maxHP: maxHP
  };
}

function CRtoAtk(cr) {
  if(cr <= 2) {
    return 3;
  } else if(cr == 3) {
    return 4;
  } else if(cr == 4) {
    return 5;
  } else if(cr <= 7) {
    return 6;
  } else if(cr <= 10) {
    return 7;
  } else if(cr <= 15) {
    return 8;
  } else if(cr == 16) {
    return 9;
  } else if(cr <= 20) {
    return 10;
  } else if(cr <= 23) {
    return 11;
  } else if(cr <= 26) {
    return 12;
  } else if(cr <= 29) {
    return 13;
  } else { // cr == 30
    return 14;
  }
}

// Calculates Damage per Round from Challenge Rating.
function CRtoDPR(cr) {
  var minDpr = 9;  // Default for CR1
  var maxDpr = 14; // ^

  if(cr == 0) {
    minDpr = 0;
    maxDpr = 1;
  } else if(cr == 1/8) {
    minDpr = 2;
    maxDpr = 3;
  } else if(cr == 1/4) {
    minDpr = 4;
    maxDpr = 5;
  } else if(cr == 1/2) {
    minDpr = 6;
    maxDpr = 8;
  } else if(cr <= 19) {
    minDpr = 9 + (6 * (cr - 1));
    maxDpr = 8 + (6 * cr);
  } else { // 20 <= cr
    minDpr = 123 + (18 * (cr - 20));
    maxDpr = 122 + (18 * (cr - 19));
  }

  return {
    minDpr: minDpr,
    maxDpr: maxDpr
  };
}

function CRtoSaveDC(cr) {
  if(cr <= 3) {
    return 13;
  } else if(cr == 4) {
    return 14;
  } else if(cr <= 7) {
    return 15;
  } else if(cr <= 10) {
    return 16;
  } else if(cr <= 12) {
    return 17;
  } else if(cr <= 16) {
    return 18;
  } else if(cr <= 20) {
    return 19;
  } else if(cr <= 23) {
    return 20;
  } else if(cr <= 26) {
    return 21;
  } else if(cr <= 29) {
    return 22;
  } else { //cr == 30
    return 23;
  }
}

function CRtoXP(cr) {
  if(cr == 0) {
    return "0 or 10";
  } else if(cr <= 1) {
    return 200 * cr; // Covers 1/8, 1/4, and 1/2 as well.
  } else {
    switch(cr) {
      case 2:
        return 450;
      case 3:
        return 700;
      case 4:
        return 1100;
      case 5:
        return 1800;
      case 6:
        return 2300;
      case 7:
        return 2900;
      case 8:
        return 3900;
      case 9:
        return 5000;
      case 10:
        return 5900;
      case 11:
        return 7200;
      case 12:
        return 8400;
      case 13:
        return 10000;
      case 14:
        return 11500;
      case 15:
        return 13000;
      case 16:
        return 15000;
      case 17:
        return 18000;
      case 18:
        return 20000;
      case 19:
        return 22000;
      case 20:
        return 25000;
      case 21:
        return 33000;
      case 22:
        return 41000;
      case 23:
        return 50000;
      case 24:
        return 62000;
      case 25:
        return 75000;
      case 26:
        return 90000;
      case 27:
        return 105000;
      case 28:
        return 120000;
      case 29:
        return 135000;
      case 30:
        return 155000;
      default:
        return "Not a valid CR for XP";
    }
  }
}

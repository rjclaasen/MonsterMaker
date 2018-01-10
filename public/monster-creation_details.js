var offensiveCR;
var defensiveCR;
var averageCR;
var suggestedAC;
var suggestedAtk;
var minHP;
var maxHP;

function SetupLoading() {
  $('a[data-toggle="tab"]').on('shown.bs.tab', function(e) {
    if($(e.target).attr('href') == "#details") {
      // Read the values from the Basics page and put them into the textboxes on the Details page.
      $('#nameTextBox_details').val($('#nameTextBox_basics').val());
      $('#ocrTextBox_details').val($('#ocrTextBox_basics').val());
      $('#dcrTextBox_details').val($('#dcrTextBox_basics').val());
      $('#crTextBox_details').val($('#crTextBox_basics').val());

      $('#proficiencyText_details').val($('#proficiencyText_basics').val());
      $('#armorclassText_details').val($('#armorclassText_basics').val());
      $('#hitpointsText_details').val($('#hitpointsText_basics').val());
      $('#atkText_details').val($('#atkText_basics').val());
      $('#dmgText_details').val($('#dmgText_basics').val());
      $('#dcText_details').val($('#dcText_basics').val());

      // Set variables
      offensiveCR = parseInt($('#ocrTextBox_details').val());
      defensiveCR = parseInt($('#dcrTextBox_details').val());
      averageCR = parseInt($('#crTextBox_details').val());
      suggestedAC = parseInt($('#armorclassText_details').val());
      suggestedAtk = parseInt($('#atkText_details').val());
      var hpRange = $('#hitpointsText_details').val().split('-');
      minHP = parseInt(hpRange[0]);
      maxHP = parseInt(hpRange[1]);
    }
  })
}

function SetupHP() {
  var acTextBox = $('#armorclassText_details');
  var hitpointsTooltip = $('#hitpointsSuggestion');
  hitpointsTooltip.hide();

  acTextBox.on('input', function() {
    var userAC = parseInt(acTextBox.val()); // The AC chosen by the user.
    var dcrAdjustment = Math.floor((userAC - suggestedAC) / 2);
    if(dcrAdjustment < 0) {
      hitpointsTooltip.show();
    } else {
      hitpointsTooltip.hide();
    }

    var suggestedHpRange = CRtoHP(defensiveCR + dcrAdjustment);
    $('#hitpointsText_details').val(RangeToString(suggestedHpRange));
  });
}

function SetupDPR() {
  var atkTextBox = $('#atkText_details');
  var dprTooltip = $('#dprSuggestion');
  dprTooltip.hide();

  atkTextBox.on('input', function() {
    var userAtk = parseInt(atkTextBox.val());
    if (!isNaN(userAtk)) {
      var ocrAdjustment = Math.floor((userAtk - suggestedAtk) / 2);
      if(ocrAdjustment < 0) {
        dprTooltip.show();
      } else {
        dprTooltip.hide();
      }

      var suggestedDprRange = CRtoDPR(offensiveCR + ocrAdjustment);
      $('#dmgText_details').val(RangeToString(suggestedDprRange));
    }
  });
}

$(document).ready(function() {
  SetupLoading();
  SetupHP();
  SetupDPR();
});

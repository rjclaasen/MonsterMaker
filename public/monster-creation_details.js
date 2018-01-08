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
    }
  })
}

$(document).ready(function() {
  SetupLoading()
});

$(document).ready(function() {
  $('#crSlider').slider({
    formatter: function(value) {
      return 'Current value: ' + value;
    }
  });
});

function setupSlider() {
  var realValues = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33];
  var labelValues = [0, 1/8, 1/4, 1/2, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30];
  var slider = $("#crSlider");
  var textBox = $("#crTextBox");

  slider.slider({
    max: 33,
    min: 0,
    step: 1,
    formatter: function(val) {
      return labelValues[val];
    }
  }).on('change', function(data){
    textBox.val(labelValues[data.value.newValue]);
  });

  function adjustSlider() {
    var newValue = labelValues.indexOf(textBox[0].valueAsNumber);
    slider.slider('setValue', newValue, true);
    console.log(textBox[0].valueAsNumber + " " + labelValues.indexOf(textBox[0].valueAsNumber) + " " + slider[0].value);
  }

  textBox.keyup(adjustSlider);
  textBox.click(adjustSlider);
}

$(document).ready(function() {
  setupSlider();
});

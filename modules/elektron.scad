function digi_box_width() = 215;
function digi_box_height() = 176;
function digi_box_depth() = 63;

module digi(box_color, label) {
  width = digi_box_width();
  depth = digi_box_height();
  height = digi_box_depth();

  union() {
    color(box_color) cube([ width, depth, height ]);

    if (label) {
      translate([ width / 2, depth / 2, height ]) color("white")
          text(label, halign = "center", valign = "center");
    }
  }
}

module digitone() { digi("#4a919e", "Digitone"); }

module syntakt() { digi("#bf5258", "Syntakt"); }

module digitakt() { digi("#df9863", "Digitakt"); }

module analog_heat() { digi("#adb2b5", "Analog Heat"); }

function digitone_keys_width() = 870;
function digitone_keys_height() = 90;
function digitone_keys_depth() = 180;

module digitone_keys() {
  width = digitone_keys_width();
  height = digitone_keys_height();
  depth = digitone_keys_depth();

  union() {
    color("#4a919e") cube([ width, depth, height ]);
    translate([ width / 2, depth / 2, height ]) color("white")
        text("Digitone Keys", halign = "center", valign = "center");
  }
}

translate(v = [ 0, 220, 90 ]) rotate(a = [ 45, 0, 0 ]) {
  digitone();

  translate(v = [ 215 + 3.33, 0, 0 ]) digitakt();

  translate(v = [ 215 * 2 + 3.33 * 2, 0, 0 ]) analog_heat();

  translate(v = [ 215 * 3 + 3.33 * 3, 0, 0 ]) syntakt();
}

digitone_keys();
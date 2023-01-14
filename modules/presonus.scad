module rounded_frontal_bass_port(width, depth, radius) {
  linear_extrude(depth) union() {
    translate([ radius, radius, 0 ]) circle(r = radius);
    translate(v = [ radius, 0, 0 ])
        square([ width - radius * 2, radius * 2 ]);
    translate(v = [ width - radius, radius, 0 ]) circle(r = radius);
  }
}

function presonus_eris_e5xt_width() = 200;
function presonus_eris_e5xt_height() = 280;
function presonus_eris_e5xt_depth() = 230;

module presonus_eris_e5xt() {
  width = presonus_eris_e5xt_width();
  height = presonus_eris_e5xt_height();
  depth = presonus_eris_e5xt_depth();

  module enclosure() {
    difference() {
      bass_port_width = 125;
      bass_port_depth = depth;
      bass_port_radius = 8;
      cube([ width, depth, height ]);
      translate(v =
                    [
                      (width - bass_port_width) / 2, -1, 20 + 2 *
                      bass_port_radius
                    ]) rotate(a = [ -90, 0, 0 ]) color("black")
          rounded_frontal_bass_port(bass_port_width, bass_port_depth,
                                    bass_port_radius);
    }
  }

  union() {
    enclosure();
    translate([ width / 2, 0, height / 2 ]) rotate([ 90, 0, 0 ])
        color("white") text("PreSonus Eris E5 XT", halign = "center",
                            valign = "center");
  }
}

presonus_eris_e5xt();

module put_on_stand(height) {
  translate([ 0, 0, height ]) children();
  translate([ 30, 30, 0 ]) cylinder(h = height, r = 10);
  translate([ 200 - 30, 30, 0 ]) cylinder(h = height, r = 10);
  translate([ 30, 200, 0 ]) cylinder(h = height, r = 10);
  translate([ 200 - 30, 200, 0 ]) cylinder(h = height, r = 10);
}
use <modules/beam.scad>
use <modules/elektron.scad>
use <modules/presonus.scad>
use <modules/rack.scad>
use <modules/rotate.scad>

tabletop_width = 1600;
tabletop_depth = 800;
tabletop_height = 20;

frame_beam_long_side = 33;
frame_beam_short_side = 21;

rack_depth = 370;
rack_enclosure_width = rack_unit_width() + 2 * frame_beam_short_side;

module tabletop() {
  color("white") translate([ 0, 0, -tabletop_height ])
      cube([ tabletop_width, tabletop_depth, tabletop_height ]);
}

module speakers() {
  speaker_width = presonus_eris_e5xt_width();
  speaker_height = presonus_eris_e5xt_height();
  speaker_depth = presonus_eris_e5xt_depth();

  speaker_center =
      [ speaker_width / 2, speaker_depth / 2, speaker_height / 2 ];

  module speaker_on_stand() {
    put_on_stand(height = 230) presonus_eris_e5xt();
  }

  color("#525252") translate([ 20, 250, 0 ])
      rotate_about(a = 30, pv = speaker_center) speaker_on_stand();

  color("#525252")
      translate([ tabletop_width - speaker_width - 20, 250, 0 ])
          rotate_about(a = -30, pv = speaker_center)
              speaker_on_stand();
}

module elektron_boxes() {
  spacing = 5;
  function x_offset(i) = i * (digi_box_width() + spacing);

  digitone();
  translate(v = [ x_offset(1), 0, 0 ]) syntakt();
  translate(v = [ x_offset(2), 0, 0 ]) digitakt();
  translate(v = [ x_offset(3), 0, 0 ]) analog_heat();
}

module rack_enclosures(spacing_from_surface) {
  translate(v = [ 0, tabletop_depth - rack_depth, 0 ]) {
    rack_enclosure(units = 8, tilt_angle = 10, depth = rack_depth,
                   spacing_from_surface = spacing_from_surface,
                   beam_long_side = frame_beam_long_side,
                   beam_short_side = frame_beam_short_side,
                   frame_color = "#9c4000") {
      translate([ 0, 0, start_at_unit(2) ]) rack_instrument(
          1, 230, "#900", "Focusrite Scarlett 18i20 MK3");
      translate([ 0, 0, start_at_unit(1) ]) rack_instrument(
          1, 230, "#900", "Focusrite Scarlett 18i20 MK3");

      translate([ 0, 0, start_at_unit(0) ])
          rack_instrument(1, 70, "#232f59", "Samson S-patch plus");
    }

    translate([ rack_unit_width() + frame_beam_short_side * 2, 0, 0 ])
        rack_enclosure(units = 8, tilt_angle = 10, depth = rack_depth,
                       spacing_from_surface = spacing_from_surface,
                       beam_long_side = frame_beam_long_side,
                       beam_short_side = frame_beam_short_side,
                       frame_color = "#9c4000") {
      rack_instrument(4, 100, "#900", "Nord Lead A1R");
    }
  }
}

tabletop();
speakers();

translate([ (tabletop_width - 2 * rack_enclosure_width) / 2, 0, 0 ])
    rack_enclosures(290);

translate([ (tabletop_width - 4 * 215 - 10) / 2, 210, 100 ])
    rotate(a = [ 45, 0, 0 ]) elektron_boxes();

translate([ (tabletop_width - digitone_keys_width()) / 2, 0, 0 ])
    digitone_keys();
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

rack_max_units = 8;
rack_tilt_angle = 10;
rack_depth = 370;
rack_ear_width = 22;

speaker_angle = 30;

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
      rotate_about(a = speaker_angle, pv = speaker_center)
          speaker_on_stand();

  color("#525252")
      translate([ tabletop_width - speaker_width - 20, 250, 0 ])
          rotate_about(a = -speaker_angle, pv = speaker_center)
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

rack_enclosure_width =
    rack_unit_width() + 2 * (frame_beam_short_side + rack_ear_width);

module rack_enclosures(spacing_from_surface) {
  translate(v = [ 0, tabletop_depth - rack_depth, 0 ]) {
    rack_enclosure(units = rack_max_units,
                   tilt_angle = rack_tilt_angle, depth = rack_depth,
                   override_tilt_offset = 20,
                   rack_ear_width = rack_ear_width,
                   spacing_from_surface = spacing_from_surface,
                   beam_long_side = frame_beam_long_side,
                   beam_short_side = frame_beam_short_side,
                   frame_color = "#9c4000") {
      translate([ 0, 0, start_at_unit(2) ]) rack_instrument(
          units = 1, depth = 230, rack_ear_width = rack_ear_width,
          c = "#900", label = "Focusrite Scarlett 18i20 MK3");
      translate([ 0, 0, start_at_unit(1) ]) rack_instrument(
          units = 1, depth = 230, rack_ear_width = rack_ear_width,
          c = "#900", label = "Focusrite Scarlett 18i20 MK3");

      rack_instrument(units = 1, depth = 70,
                      rack_ear_width = rack_ear_width, c = "#232f59",
                      label = "Samson S-patch plus");
    }

    translate([ rack_enclosure_width, 0, 0 ]) rack_enclosure(
        units = rack_max_units, tilt_angle = rack_tilt_angle,
        depth = rack_depth, override_tilt_offset = 20,
        rack_ear_width = rack_ear_width,
        spacing_from_surface = spacing_from_surface,
        beam_long_side = frame_beam_long_side,
        beam_short_side = frame_beam_short_side,
        frame_color = "#9c4000") {
      rack_instrument(units = 4, depth = 100,
                      rack_ear_width = rack_ear_width, c = "#900",
                      label = "Nord Rack 2");
      translate([ 0, 0, start_at_unit(4) ]) rack_instrument(
          units = 4, depth = 100, rack_ear_width = rack_ear_width,
          c = "#900", label = "Nord Lead A1R");
    }
  }
}

tabletop();
speakers();

translate([ (tabletop_width - 2 * rack_enclosure_width) / 2, 0, 0 ])
    rack_enclosures(290);

translate([
  (tabletop_width - 4 * digi_box_width() - 10) / 2, 210,
  digitone_keys_height() + 10
]) rotate(a = [ 40, 0, 0 ]) elektron_boxes();

translate([ (tabletop_width - digitone_keys_width()) / 2, 0, 0 ])
    digitone_keys();
use <beam.scad>
use <math.scad>
use <rotate.scad>

function rack_unit_width() = 450.85;
function rack_unit_height() = 44.45;

function unit_to_length(units) = units * rack_unit_height();
function start_at_unit(unit) = unit * rack_unit_height();

module rack_enclosure(units = 0, depth, tilt_angle, rack_ear_width,
                      override_tilt_offset, beam_long_side,
                      beam_short_side, spacing_from_surface,
                      frame_color) {
  outer_width =
      rack_unit_width() + 2 * (beam_short_side + rack_ear_width);

  // when the tilting angle is greater than zero, additional space is
  // needed so that the rack ears can fit
  offset_due_tilt =
      is_undef(override_tilt_offset)
          ? beam_long_side * sin(tilt_angle) / sin(90 - tilt_angle)
          : override_tilt_offset;

  module rack_beam(length, rotation = [ 0, 0, 0 ], a_start_short,
                   a_start_long, a_stop_short, a_stop_long, ) {
    rotate(rotation) beam(
        length = length, short_side = beam_short_side,
        long_side = beam_long_side, a_start_short = a_start_short,
        a_start_long = a_start_long, a_stop_short = a_stop_short,
        a_stop_long = a_stop_long);
  }

  module frame(rear_beam = false) {
    module frame_beam(length) {
      translate(v = [ 0, beam_short_side, 0 ]) rotate([ 90, 0, 0 ])
          rack_beam(length = length);
    }

    // front
    frame_beam(outer_width);

    if (rear_beam) {
      // rear
      translate(v = [ 0, depth - beam_short_side, 0 ])
          frame_beam(outer_width);
    }

    // left
    translate(v = [ beam_short_side, beam_short_side, 0 ])
        rotate([ 0, 0, 90 ])
            frame_beam(depth - (rear_beam ? 2 : 1) * beam_short_side);
    // right
    translate(v = [ outer_width, beam_short_side, 0 ])
        rotate([ 0, 0, 90 ])
            frame_beam(depth - (rear_beam ? 2 : 1) * beam_short_side);
  }

  module riser() {
    module legs() {
      module leg() {
        translate(v = [ beam_short_side, 0, 0 ]) rotate([ 0, -90, 0 ])
            rack_beam(length =
                          spacing_from_surface - 3 * beam_long_side);
      }

      // front left
      leg();
      // rear left
      translate(v = [ 0, depth - beam_long_side, 0 ]) leg();
      // rear right
      translate(v = [
        outer_width - beam_short_side, depth - beam_long_side, 0
      ]) leg();
      // front right
      translate(v = [ outer_width - beam_short_side, 0, 0 ]) leg();
    }

    frame(rear_beam = true);
    translate(v = [ 0, 0, beam_long_side ]) legs();
    translate(v = [ 0, 0, spacing_from_surface - 2 * beam_long_side ])
        frame();
  }

  module enclosure(front_tilt_angle) {
    frontal_beam_length = unit_to_length(units) + offset_due_tilt;

    module vertical_enclosure_beam(length, start_angle, stop_angle) {
      translate([ 0, beam_long_side, 0 ]) rotate([ 90, -90, 90 ])
          rack_beam(length = length, a_start_long = start_angle,
                    a_stop_long = stop_angle);
    }

    module frontal_beam() {
      translate(v = [ 0, 0, beam_long_side ])
          rotate(a = [ -front_tilt_angle, 0, 0 ])
              vertical_enclosure_beam(length = frontal_beam_length,
                                      start_angle = front_tilt_angle);
    }

    module rear_beam() {
      frontal_beam_inner_offset =
          beam_long_side * sin(tilt_angle) / sin(90 - tilt_angle);
      frontal_beam_inner_length =
          frontal_beam_length - frontal_beam_inner_offset;

      frame_inner_offset = beam_long_side / sin(90 - tilt_angle);
      frame_inner_length = depth - frame_inner_offset;

      length = triangle_side_two_sides_angle(
          frame_inner_length, frontal_beam_inner_length,
          90 - front_tilt_angle);

      angle = 90 - triangle_A_from_all_sides(
                       a = frontal_beam_inner_length, b = length,
                       c = frame_inner_length);

      translate([ 0, depth - beam_long_side, beam_long_side ])
          rotate_about(a = [ angle, 0, 0 ],
                       pv = [ 0, beam_long_side, 0 ])
              vertical_enclosure_beam(
                  length = length, start_angle = -angle,
                  stop_angle = 90 - front_tilt_angle - angle);
    }

    rear_beam();
    frontal_beam();
    translate(v = [ outer_width - beam_short_side, 0, 0 ]) {
      rear_beam();
      frontal_beam();
    }

    frame();
  }

  color(frame_color) {
    riser();
    translate(v = [ 0, 0, spacing_from_surface - beam_long_side ])
        enclosure(front_tilt_angle = tilt_angle);
  }

  translate(v = [
    beam_short_side, 0, spacing_from_surface + offset_due_tilt
  ]) rotate(a = [ -tilt_angle, 0, 0 ]) children();
}

module rack_instrument(units, depth, rack_ear_width, c, label) {
  height = unit_to_length(units);
  module instrument() {
    color("black") cube([ rack_ear_width, rack_ear_width, height ]);

    translate([ rack_unit_width() + rack_ear_width, 0, 0 ])
        color("black")
            cube([ rack_ear_width, rack_ear_width, height ]);

    color(c) translate([ rack_ear_width, 0, 0 ]) cube(
        [ rack_unit_width(), depth, height ]);
  }

  union() {
    instrument();

    if (label) {
      translate([ rack_unit_width() / 2, 0, height / 2 ])
          rotate([ 90, 0, 0 ])
              text(label, halign = "center", valign = "center");
    }
  }
}

rack_enclosure(units = 8, tilt_angle = 10, rack_ear_width = 22, depth = 370,
               spacing_from_surface = 270, beam_long_side = 33,
               beam_short_side = 21, frame_color = "#9c4000") {
  for (i = [0:1:7]) {
    translate([ 0, 0, start_at_unit(i) ])
        rack_instrument(units = 1, depth = 200, rack_ear_width = 22);
  }
}
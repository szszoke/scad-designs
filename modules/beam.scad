nothing = 0.01;

module beam(length, long_side, short_side, a_start_short,
            a_start_long, a_stop_short, a_stop_long) {
  echo(str("BOM:beam:length=", length, ",long_side=", long_side,
           ",short_side=", short_side, ",a_start_short=", a_start_short,
           ",a_start_long=", a_start_long, ",a_stop_short=",
           a_stop_short, ",a_stop_long=", a_stop_long));
  difference() {
    cube([ length, long_side, short_side ]);

    /*
      make the ends angled by subtracting a triangle from them

         a        b        c
      ------ = ------ = ------
      sin(A)   sin(B)   sin(C)
              B
             /\
          c /  \ a
           /    \
        A /______\ C
              b

      two angles and a side is always known
      - the corner angle which is always 90
      - the angle parameter
      - the length of the side which is going to be angled
    */

    if (!is_undef(a_start_short)) {
      /*
        A angle is 90
        B angle is 90 - a_start_short
        C angle is a_start_short
        c side is short_side
        b side length is missing

        b = c * sin(C) / sin(B)
      */

      b_length =
          short_side * sin(a_start_short) / sin(90 - a_start_short);

      if (a_start_short > 0) {
        translate([ -nothing, long_side + nothing, -nothing ])
            rotate([ 90, 0, 0 ])
                linear_extrude(long_side + 2 * nothing)
                    polygon(points = [
                      [ -nothing, 0 ], [ 0, short_side - nothing ],
                      [ b_length + nothing, -nothing ]
                    ]);
      } else {
        translate([ -nothing, -nothing, short_side + nothing ])
            rotate([ -90, 0, 0 ])
                linear_extrude(long_side + 2 * nothing)
                    polygon(points = [
                      [ -nothing, short_side ],
                      [ -b_length, -nothing ], [ 0, -nothing ]
                    ]);
      }
    } else if (!is_undef(a_start_long)) {
      /*
        A angle is 90
        B angle is 90 - a_start_long
        C angle is a_start_long
        c side is long_side
        b side length is missing

        b = c * sin(C) / sin(B)
      */

      b_length =
          long_side * sin(a_start_long) / sin(90 - a_start_long);

      if (a_start_long > 0) {
        translate([ -nothing, -nothing, -nothing ])
            linear_extrude(short_side + 2 * nothing)
                polygon(points = [
                  [ -nothing, 0 ], [ 0, long_side - nothing ],
                  [ b_length + nothing, -nothing ]
                ]);
      } else {
        translate([ -nothing, 0, -nothing ])
            linear_extrude(short_side + 2 * nothing)
                polygon(points = [
                  [ -b_length, long_side + nothing ], [ 0, 0 ],
                  [ 0, long_side + nothing ]
                ]);
      }
    }

    if (!is_undef(a_stop_short)) {
      /*
        A angle is 90
        B angle is 90 - a_stop_short
        C angle is a_stop_short
        c side is short_side
        b side length is missing

        b = c * sin(C) / sin(B)
      */

      b_length =
          short_side * sin(a_stop_short) / sin(90 - a_stop_short);

      if (a_stop_short > 0) {
        translate([ 0, long_side + nothing, 0 ]) rotate([ 90, 0, 0 ])
            linear_extrude(long_side + 2 * nothing) polygon(
                points = [[length + nothing, 0],
                          [length + nothing, short_side + nothing],
                          [length - b_length + nothing,
                           short_side + nothing]]);
      } else {
        translate([ 0, long_side + nothing, -nothing ]) rotate(
            [ 90, 0, 0 ]) linear_extrude(long_side + 2 * nothing)
            polygon(points =
                        [[length + b_length, 0],
                         [length + nothing, 0],
                         [length + nothing, short_side + nothing]]);
      }
    } else if (!is_undef(a_stop_long)) {
      /*
        A angle is 90
        B angle is 90 - a_stop_long
        C angle is a_stop_long
        c side is long_side
        b side length is missing

        b = c * sin(C) / sin(B)
      */

      b_length = long_side * sin(a_stop_long) / sin(90 - a_stop_long);

      if (a_stop_long > 0) {
        translate([ 0, 0, -nothing ])
            linear_extrude(short_side + 2 * nothing) polygon(
                points = [[length - b_length, long_side + nothing],
                          [length + nothing, -nothing],
                          [length + nothing, long_side + nothing]]);
      } else {
        translate([ 0, 0, -nothing ])
            linear_extrude(short_side + 2 * nothing) polygon(
                points = [[length + b_length, -nothing],
                          [length + nothing, -nothing],
                          [length + nothing, long_side + nothing]]);
      }
    }
  }
}

beam(length = 100, long_side = 33, short_side = 22,
     a_start_short = 30, a_stop_short = 30);
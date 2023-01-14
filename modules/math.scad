function triangle_side_two_sides_angle(l1, l2, angle) =
    sqrt(pow(l1, 2) + pow(l2, 2) - 2 * l1 * l2 * cos(angle));

function triangle_A_from_all_sides(a, b, c) =
    acos((pow(b, 2) + pow(c, 2) - pow(a, 2)) / (2 * b * c));
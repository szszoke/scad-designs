module rotate_about(a, pv) {
  translate(v = pv) rotate(a = a) translate(v = -pv) children();
}
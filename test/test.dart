void main() {
  double tol = 0.1;
  for (int ii = 0; ii < 100; ii++) {
    print(tol);
    tol = tol + (tol / 4);
  }
}

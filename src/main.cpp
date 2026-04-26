extern "C" {
  void adainit();
  void adafinal();
  void cob_init();

  void print_h1();
  void print_e2();
  void print_l3();
  void print_l4();
  void print_o5();
  void print_comma6();
  void print_space7();
  void print_w8();
  void print_o9();
  void print_r10();
  void print_l11();
}

int main() {
  cob_init();
  adainit();

  print_h1();
  print_e2();
  print_l3();
  print_l4();
  print_o5();
  print_comma6();
  print_space7();
  print_w8();
  print_o9();
  print_r10();
  print_l11();

  adafinal();
  return 0;
}

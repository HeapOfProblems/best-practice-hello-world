subroutine print_e2() bind(C, name="print_e2")
  use iso_c_binding
  implicit none

  write (*, '(A)', advance='no') 'e'
end subroutine print_e2

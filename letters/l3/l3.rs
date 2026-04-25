#[no_mangle]
fn print_l3() {
    use std::io::{self, Write};

    print!("l");
    io::stdout().flush().unwrap();
}

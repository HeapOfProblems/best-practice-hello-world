package main

import (
	"C"
	"fmt"
)

//export print_o5
func print_o5() {
	fmt.Print("o")
}

func main() {}

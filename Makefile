.PHONY: clear build_binary run all
.DEFAULT_GOAL := all

build:
	mkdir -p $@

build/h1.o: letters/h1/h1.asm | build
	nasm -f elf64 $< -o $@

build/e2.o: letters/e2/e2.f90 | build
	gfortran -c $< -o $@

build/l3.a: letters/l3/l3.rs | build
	rustc --crate-type=staticlib $< -o $@

build/l4.o: letters/l4/l4.zig | build
	zig build-obj $< -fPIC -femit-bin=$@

build/o5.a: letters/o5/o5.go | build
	go build -buildmode=c-archive -o $@ $<

build/comma6.o: letters/comma6/comma6.pas | build
	fpc -Cg -Cn -FUbuild -FEbuild $<

build/combiner.o: src/main.cpp | build
	clang++ $< -c -o $@

build/HelloWorld: build build/combiner.o build/h1.o build/e2.o build/l3.a build/l4.o build/o5.a build/comma6.o
	clang++ ./build/*.o ./build/*.a -lgfortran -o $@

clear:
	- rm -rf ./build

build_binary: build/HelloWorld
	@echo "📦 Binary 'HelloWorld' successfully generated in ./build/"

run:
	@echo "⏳ The moment of truth..."
	@./build/HelloWorld
	@echo ""
	@echo "✅ Execution finished."

all: clear build_binary run

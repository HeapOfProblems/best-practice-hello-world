.PHONY: clear build_binary run info all
.DEFAULT_GOAL := all

OBJS = build build/combiner.o build/h1.o build/e2.o build/l3.a build/l4.o build/o5.a build/comma6.o build/space7.o build/ada_binder.o build/w8.a build/o9.o build/r10.o build/l11.o build/d12.o build/exclamation13.o

build:
	mkdir -p $@

build/h1.o: letters/h1/h1.asm | build
	nasm -f elf64 -o $@ $<

build/e2.o: letters/e2/e2.f90 | build
	gfortran -c -o $@ $<

build/l3.a: letters/l3/l3.rs | build
	rustc --crate-type=staticlib -o $@ $<

build/l4.o: letters/l4/l4.zig | build
	zig build-obj $< -fPIC -femit-bin=$@

build/o5.a: letters/o5/o5.go | build
	go build -buildmode=c-archive -o $@ $<

build/comma6.o: letters/comma6/comma6.pas | build
	fpc -Cg -Cn -FUbuild -FEbuild $<

build/space7.o: letters/space7/print_space.adb letters/space7/print_space.ads | build
	gcc -c -gnatp -o build/print_space.o $<
	mv build/print_space.o $@

build/ada_binder.o: build/print_space.ali | build/space7.o build
	gnatbind -n $<
	gcc -c b~print_space.adb -o b~print_space.o
	mv b~print_space.o $@
	rm b~print_space.ali

build/w8.a: letters/w8/w8.kt | build
	kotlinc-native -produce static -o build/w8 $<

build/o9.o: letters/o9/o9.c | build
	clang -c -o $@ $<

build/r10.o: letters/r10/r10.d | build
	ldc2 -c -of=$@ $<

build/l11.o: letters/l11/l11.cob | build
	cobc -c -A "-fno-lto" -o $@ $<

build/d12.o: letters/d12/d12.ml | build
	ocamlopt -output-complete-obj -o $@ $<

build/exclamation13.o: letters/exclamation13/exclamation13.c | build
	clang -c -std=c23 $$(python3-config --cflags) -o $@ $<

build/combiner.o: src/main.cpp | build
	clang++ -c -o $@ $<

build/HelloWorld: $(OBJS)
	clang++ -o $@ ./build/*.o ./build/*.a \
		-lgfortran -lgnat -lcob -lasmrun -lm -ldl -lpthread \
		-L$(shell ocamlc -where) $$(python3-config --ldflags --libs --embed)

clear:
	- rm -rf ./build

build_binary: build/HelloWorld
	@echo "📦 Binary 'HelloWorld' successfully generated in ./build/"

run:
	@echo "⏳ The moment of truth..."
	@./build/HelloWorld
	@echo ""
	@echo "✅ Execution finished."

info:
	@echo "* 🛍️ The shared dependencies:"
	@ldd ./build/HelloWorld
	@echo ""
	@echo "* 💿 The binary size:"
	@du -h ./build/HelloWorld

all: clear build_binary run

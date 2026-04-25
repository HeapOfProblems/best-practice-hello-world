.PHONY: clear build_binary run all
.DEFAULT_GOAL := all

build:
	mkdir -p $@

build/h1.o: letters/h1/h1.asm | build
	nasm -f elf64 $< -o $@

build/combiner.o: src/main.cpp | build
	clang++ $< -c -o $@

build/HelloWorld: build build/combiner.o build/h1.o
	clang++ ./build/*.o -o $@

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

.PHONY: build_binary run all
.DEFAULT_GOAL := all

build:
	mkdir -p build

build/HelloWorld: build
	echo 'int main(){}' | clang -x c - -o ./build/HelloWorld

build_binary: build build/HelloWorld
	@echo "📦 Binary 'HelloWorld' successfully generated in ./build/"

run:
	@echo "⏳ The moment of truth..."
	@./build/HelloWorld
	@echo "✅ Execution finished."

all: build_binary run

.PHONY: all clean watch

CURRENT_DIR := $(shell pwd)
OUTPUT_DIR := $(CURRENT_DIR)/output
SRC_DIR := $(CURRENT_DIR)/src

all:
	mkdir -p $(OUTPUT_DIR)
	docker run --rm -v $(CURRENT_DIR):/workdir -w /workdir/src registry.gitlab.com/islandoftex/images/texlive:latest latexmk -pdf -output-directory=../output main.tex

watch:
	mkdir -p $(OUTPUT_DIR)
	docker run --rm -v $(CURRENT_DIR):/workdir -w /workdir/src registry.gitlab.com/islandoftex/images/texlive:latest latexmk -pdf -pvc -output-directory=../output main.tex

clean:
	rm -rf $(OUTPUT_DIR)
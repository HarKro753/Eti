LATEXMK ?= latexmk
BUILD_DIR := .latex-build

TEXFILES := $(shell find Blatt1 Blatt2 -name '*.tex')
PDFS := $(patsubst %.tex,%.pdf,$(TEXFILES))

.PHONY: all clean list

all: $(PDFS)

%.pdf: %.tex
	@mkdir -p $(BUILD_DIR)/$(dir $<)
	$(LATEXMK) -pdf -interaction=nonstopmode -halt-on-error -outdir=$(BUILD_DIR)/$(dir $<) $<
	@cp $(BUILD_DIR)/$@ $@

list:
	@printf '%s\n' $(PDFS)

clean:
	@find . -type f \( \
		-name '*.aux' -o \
		-name '*.bbl' -o \
		-name '*.bcf' -o \
		-name '*.blg' -o \
		-name '*.fdb_latexmk' -o \
		-name '*.fls' -o \
		-name '*.log' -o \
		-name '*.nav' -o \
		-name '*.out' -o \
		-name '*.run.xml' -o \
		-name '*.snm' -o \
		-name '*.synctex.gz' -o \
		-name '*.toc' -o \
		-name '*.vrb' \
	\) -delete
	@rm -rf $(BUILD_DIR) build

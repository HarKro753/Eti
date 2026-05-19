LATEXMK ?= latexmk
BUILD_DIR := .latex-build

TEXFILES := $(patsubst ./%,%,$(shell find . -path './.git' -prune -o -path './$(BUILD_DIR)' -prune -o -type f -name '*.tex' -print))
PDFS := $(TEXFILES:.tex=.pdf)

.PHONY: all clean list

all: $(PDFS)

%.pdf: %.tex
	@mkdir -p $(BUILD_DIR)/$(dir $<)
	$(LATEXMK) -pdf -interaction=nonstopmode -halt-on-error -outdir=$(dir $@) -auxdir=$(BUILD_DIR)/$(dir $<) $<

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

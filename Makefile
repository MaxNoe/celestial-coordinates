all: build/celestial-coordinates.pdf

plots: build/polar_motion.pdf

build/polar_motion.pdf: plots/plot_polar_motion.py
	python $<
	pdfcrop $@ $@


build/celestial-coordinates.pdf: plots FORCE
	TEXINPUTS=beamertheme-vertex:.:../thesis: \
	latexmk \
		--lualatex \
		--interaction=nonstopmode \
		--halt-on-error \
		--output-directory=build \
		--file-line-error \
		--shell-escape \
		celestial-coordinates.tex


preview: plots FORCE
	TEXINPUTS=beamertheme-vertex:.:../thesis: \
	latexmk \
		--lualatex \
		--interaction=nonstopmode \
		--halt-on-error \
		--output-directory=build \
		--file-line-error \
		--shell-escape \
		-pvc \
		celestial-coordinates.tex


build:
	mkdir -p $@


FORCE:

clean:
	rm -rf build

.PHONY: all clean FORCE

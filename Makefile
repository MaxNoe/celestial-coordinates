all: build/celestial-coordinates.pdf


build/celestial-coordinates.pdf: FORCE
	TEXINPUTS=beamertheme-vertex:.:../thesis: \
	latexmk \
		--lualatex \
		--interaction=nonstopmode \
		--halt-on-error \
		--output-directory=build \
		--file-line-error \
		--shell-escape \
		celestial-coordinates.tex


preview: FORCE
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

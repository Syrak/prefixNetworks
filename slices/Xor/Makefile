TEX_TO_PDF=rubber --pdf -s -f -q -I figures

FIG=
TEX=$(FIG:%=figures/%) table figures
DOC=xor
DOCTEX=$(DOC).tex
ARCHIVE=$(DOC).tar.gz
LHS=Construct
SRC=$(TEX:%=%.tex) $(LHS:%=%.lhs) $(DOCTEX)

$(DOC).pdf: $(SRC)
	$(TEX_TO_PDF) $(DOCTEX)

archive: $(SRC)
	tar czf $(ARCHIVE) $(SRC) Makefile

clean:
	rm -f *.nav *.aux *.log *.blg *.bbl *.out

.PHONY: archive

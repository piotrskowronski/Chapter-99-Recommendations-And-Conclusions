FILE=main

default: pdf

clean:
	rm -f $(FILE).dvi $(FILE).ps

pdf: $(FILE).tex # PDF with hyperlinks, requires extra package included in the header (main.tex)
	pdflatex -halt-on-error $(FILE).tex
	pdflatex -halt-on-error $(FILE).tex

postscript: dvi
	dvips -swap -f < $(FILE).dvi 2>/dev/null > $(FILE).ps

dvi: $(FILE).tex
	latex -halt-on-error $(FILE).tex
	latex -halt-on-error $(FILE).tex

edit: 
	nedit main.tex  \
	      intro.tex \
	      bibliography.tex &

file=main
pdfviewer=evince
latexcompile=pdflatex

all: first 
	$(latexcompile) $(file).tex
	$(pdfviewer) $(file).pdf &	
clear:
	rm *.aux *.dvi *.log *.out *.pdf *.snm *.toc *.nav 
first:
	$(latexcompile) $(file).tex 

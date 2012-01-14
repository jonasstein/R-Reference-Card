# set latexfile to the name of the main file without the .tex
latexfile = R-refcard

TEX = pdflatex

$(latexfile).pdf : clean
	while ($(TEX) $(latexfile) ; \
	grep -q "Rerun to get cross" $(latexfile).log ) do true ; \
	done

pdf : $(latexfile).pdf


view : $(latexfile).pdf
	acroread $(latexfile).pdf

clean : 
	rm -f $(latexfile).log 
	rm -f $(latexfile).out
	rm -f $(latexfile).aux
	rm -f $(latexfile).bbl
	rm -f $(latexfile).blg
	rm -f $(latexfile)-blx.bib
	rm -f $(latexfile).toc
	rm -f *.*~

purge : clean
	rm  $(latexfile).pdf

spellcheck:
	hunspell -l -t -i utf-8 $(latexfile).tex

test: 
	chktex $(latexfile).tex
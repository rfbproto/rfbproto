all: rfbproto.pdf rfbproto.html

.SUFFIXES : .rst .pdf .html

.rst.pdf:
	mkdir -p tmp
	./rsttool rst2newlatex "$<" tmp/tmp.tex
	(cd tmp; pdflatex tmp.tex)
	# We need to run it twice for links and TOC to work
	(cd tmp; pdflatex tmp.tex)
	mv tmp/tmp.pdf "$@"

.rst.html:
	./rsttool rst2html "$<" "$@"

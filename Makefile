all: rfbproto.pdf rfbproto.html

.SUFFIXES : .rst .pdf .html

.rst.tex:
	./rsttool rst2latex "$<" "$@"

.tex.pdf:
	pdflatex "$<"
	# We need to run it twice for links and TOC to work
	pdflatex "$<"
	rm "$*.log" "$*.aux" "$*.toc"

.rst.html:
	./rsttool rst2html "$<" "$@"

clean:
	rm -f rfbproto.pdf rfbproto.html
	rm -f rfbproto.tex rfbproto.log rfbproto.aux rfbproto.toc

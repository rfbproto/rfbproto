all: rfbproto.pdf rfbproto.html

.SUFFIXES : .rst .pdf .html

.rst.pdf:
	rst2pdf "$<" "$@"

.rst.html:
	./rsttool rst2html "$<" "$@"

clean:
	rm -f rfbproto.pdf rfbproto.html

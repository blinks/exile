push : exile.pdf
	butler push --if-changed exile.pdf blinks/exile:book

exile.pdf : README.asciidoc
	asciidoctor-pdf README.asciidoc -o exile.pdf

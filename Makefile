push : exile.pdf buildnumber.txt
	butler push --if-changed --userversion-file=buildnumber.txt \
		exile.pdf blinks/exile:book


exile.pdf : README.asciidoc buildnumber.txt
	asciidoctor-pdf README.asciidoc -o exile.pdf

buildnumber.txt : README.asciidoc
	echo `git describe --tags` > buildnumber.txt

.PHONY: push clean

clean :
	rm exile.pdf buildnumber.txt

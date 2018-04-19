push : exile.pdf buildnumber.txt
	git push origin --tags
	butler push --if-changed --userversion-file=buildnumber.txt \
		exile.pdf blinks/exile:book


exile.pdf : README.asciidoc buildnumber.txt
	asciidoctor-pdf README.asciidoc -o exile.pdf

buildnumber.txt : README.asciidoc
	echo `git tag --contains HEAD`-`git log -1 --pretty="%h"` > buildnumber.txt

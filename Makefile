TOP=../..
COUNTOL=${TOP}/tools/bashtools/countol.sh
PKGDIR=${TOP}/tmp/rentroll

webdoc: *.go
	@touch fail
	# @${COUNTOL} "go vet"
	# @${COUNTOL} golint
	go vet
	golint
	go build
	@rm -f fail

clean:
	rm -rf webdoc ver.go fail doc
	@echo "*** CLEAN completed in webdoc ***"

test:
	@echo "*** TEST completed in webdoc ***"

man:
	nroff -man webdoc.1
	cp webdoc.1 /usr/local/share/man/man1

docs:
	rm -rf doc
	./webdoc ${TOP}/ws

package: docs
	rm -rf ${PKGDIR}/doc
	mkdir -p ${PKGDIR}/doc
	cp tester.html doc/
	cp doc/*.html ${PKGDIR}/doc/
	cp doc.css ${PKGDIR}/doc/
	@echo "*** PACKAGE completed in webdoc ***"

VERSION=03

DRAFT=draft-behringer-anima-reference-model

${DRAFT}-${VERSION}.txt: ${DRAFT}.txt
	cp ${DRAFT}.txt ${DRAFT}-${VERSION}.txt
	git add ${DRAFT}-${VERSION}.txt ${DRAFT}.txt

%.txt: %.xml
	unset DISPLAY; XML_LIBRARY=$(XML_LIBRARY):./src xml2rfc $? $@

%.html: %.xml
	unset DISPLAY; XML_LIBRARY=$(XML_LIBRARY):./src xml2rfc --html -o $@ $?


DIAGRAMS=network1-reference.svg network2-discovery.svg network3-identity.svg network4-identity.svg
DIAGRAMS+=network5-imprint.svg network6-domainjoined.svg network7-secured.svg network8-uplink-discovery.dia
diagrams: ${DIAGRAMS}

%.svg: %.dia
	dia --export=$@ --filter=svg $<

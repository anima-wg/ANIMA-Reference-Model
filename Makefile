VERSION=03

DRAFT=draft-behringer-anima-reference-model

${DRAFT}-${VERSION}.txt: ${DRAFT}.txt
	cp ${DRAFT}.txt ${DRAFT}-${VERSION}.txt
	git add ${DRAFT}-${VERSION}.txt ${DRAFT}.txt

%.txt: %.xml
	unset DISPLAY; XML_LIBRARY=$(XML_LIBRARY):./src xml2rfc $? $@

%.html: %.xml
	unset DISPLAY; XML_LIBRARY=$(XML_LIBRARY):./src xml2rfc --html -o $@ $?


DIAGRAMS=network1-reference.svg network2-awareness.svg network3-discovery.svg network4-identity.svg network5-routing.svg
DIAGRAMS+=network6-imprint.svg network7-domainjoined.svg network8-secured.svg network9-uplink-discovery.svg
diagrams: ${DIAGRAMS}

%.svg: %.dia
	dia --export=$@ --filter=svg $<

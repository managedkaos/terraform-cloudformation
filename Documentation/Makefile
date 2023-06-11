PDF_FILES = $(wildcard *.pdf)
ifeq ($(wildcard status.conf),)
    STATUS_CONF =
else
    STATUS_CONF = status.conf
endif

zip: $(PDF_FILES)
	zip -r ./Demos.zip *.pdf $(STATUS_CONF)


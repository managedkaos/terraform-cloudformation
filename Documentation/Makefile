PDF_FILES = $(wildcard *.pdf)
TXT_FILES = $(wildcard *.txt)

ifeq ($(wildcard status.conf),)
    STATUS_CONF =
else
    STATUS_CONF = status.conf
endif

./Demos.zip: $(PDF_FILES) $(TXT_FILES) $(STATUS_CONF)
	zip -r ./Demos.zip *.pdf *.txt $(STATUS_CONF)


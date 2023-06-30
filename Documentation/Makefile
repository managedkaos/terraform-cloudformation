PDF_FILES = $(wildcard *.pdf)
TXT_FILES = $(wildcard *.txt)
CONFIG_FILES = $(wildcard *.conf)

./Demos.zip: $(PDF_FILES) $(TXT_FILES) $(CONFIG_FILES)
	zip -r ./Demos.zip $(PDF_FILES) $(TXT_FILES) $(CONFIG_FILES)


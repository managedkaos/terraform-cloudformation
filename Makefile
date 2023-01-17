ENVIRONMENT ?= development
TARGETS     := init plan apply refresh cost format clean upgrade output install

$(TARGETS):
	make --directory=./$(ENVIRONMENT) $(@)

.PHONY: $(TARGETS)

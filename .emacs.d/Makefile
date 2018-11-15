CASK_PATH = $(shell brew --cellar cask)/$(shell cask --version)
CASK_BIN = /usr/bin/env cask

EMACS_D_PATH = $(HOME)/.emacs.d

OBJS = $(EMACS_D_PATH)/Cask

all: install

$(EMACS_D_PATH):
	mkdir -p $(EMACS_D_PATH)
$(EMACS_D_PATH)/customizations:
	cp -r customizations $(EMACS_D_PATH)
$(EMACS_D_PATH)/.cask:
	cd $(EMACS_D_PATH); $(CASK_BIN) install
$(EMACS_D_PATH)/init.el:
	echo $(CASK_PATH)
	/usr/bin/env sed -e "s=CP=$(CASK_PATH)=g" init.el.tpl > $@

$(OBJS):
	cp $(notdir $@) $@

.PHONY: deps
deps: $(EMACS_D_PATH)/.cask

.PHONY: install
install: $(EMACS_D_PATH) $(OBJS) $(EMACS_D_PATH)/init.el deps

.PHONY: uninstall
uninstall:
	rm -rf $(EMACS_D_PATH)

.PHONY: update
update: deps


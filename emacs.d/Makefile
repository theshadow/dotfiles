CASK_PATH = $(shell brew --cellar cask)/$(shell cask --version)
CASK_BIN = /usr/bin/env cask
GIT_BIN = /usr/bin/env git
SED_BIN = /usr/bin/env sed

EMACS_D_PATH = $(HOME)/.emacs.d

OBJS = $(EMACS_D_PATH)/Cask

all: install

$(EMACS_D_PATH):
	mkdir -p $(EMACS_D_PATH)
$(EMACS_D_PATH)/customizations:
	cp -r customizations $(EMACS_D_PATH)
$(EMACS_D_PATH)/.cask/%/elpa:
	cd $(EMACS_D_PATH); $(CASK_BIN) install
$(EMACS_D_PATH)/.cask: 
	cd $(EMACS_D_PATH); $(CASK_BIN) install --debug
$(EMACS_D_PATH)/init.el:
	$(SED_BIN) -e "s=CP=$(CASK_PATH)=g" init.el.tpl > $@
git-repos:
	mkdir -p $(EMACS_D_PATH)/customizations/git-mode
	cd $(EMACS_D_PATH)/customizations/git-mode; $(GIT_BIN) clone https://github.com/ptrv/goflycheck.git

	mkdir -p $(EMACS_D_PATH/customizations/yasnippet-go
	cd $(EMACS_D_PATH/customizations/yasnippet-go; $(GIT_BIN) clone https://github.com/dominikh/yasnippet-go.git

$(OBJS):
	cp $(notdir $@) $@

.PHONY: deps
deps: git-repos $(EMACS_D_PATH)/.cask/%/elpa $(EMACS_D_PATH)/.cask

.PHONY: install
install: $(EMACS_D_PATH) $(OBJS) $(EMACS_D_PATH)/init.el $(EMACS_D_PATH)/customizations deps

.PHONY: uninstall
uninstall:
	rm -rf $(EMACS_D_PATH)

.PHONY: update
update: deps


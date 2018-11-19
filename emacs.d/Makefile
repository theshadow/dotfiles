CASK_BIN = /usr/bin/env cask
GIT_BIN = /usr/bin/env git

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
	cp -f init.el.tpl $@
git-repos:
	cd $(EMACS_D_PATH)/customizations; $(GIT_BIN) clone https://github.com/dougm/goflymake.git
	cd $(EMACS_D_PATH/customizations; $(GIT_BIN) clone https://github.com/dominikh/yasnippet-go.git

$(OBJS):
	cp $(notdir $@) $@

.PHONY: deps
deps: git-repos $(EMACS_D_PATH)/.cask

.PHONY: install
install: $(EMACS_D_PATH) $(OBJS) $(EMACS_D_PATH)/init.el $(EMACS_D_PATH)/customizations deps

.PHONY: uninstall
uninstall:
	rm -rf $(EMACS_D_PATH)

.PHONY: update
update: deps

.PHONY: reinstall
reinstall: uninstall install

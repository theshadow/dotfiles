CASK_BIN = /usr/bin/env cask
GIT_BIN = /usr/bin/env git
GO_BIN = /usr/bin/env go

EMACS_D_PATH = $(HOME)/.emacs.d

OBJS = $(EMACS_D_PATH)/Cask

GO_DEPS = $(GOBIN)/errcheck $(GOBIN)/goflymake $(GOBIN)/unconvert $(GOBIN)/goimports

all: install

$(EMACS_D_PATH):
	mkdir -p $(EMACS_D_PATH)
$(EMACS_D_PATH)/customizations:
	cp -r customizations $(EMACS_D_PATH)
$(EMACS_D_PATH)/.cask: 
	cd $(EMACS_D_PATH); $(CASK_BIN) install
$(EMACS_D_PATH)/init.el:
	cp -f init.el $@
git-repos:
	cd $(EMACS_D_PATH)/customizations; $(GIT_BIN) clone https://github.com/dominikh/yasnippet-go.git
	cd $(EMACS_D_PATH)/customizations; $(GIT_BIN) clone https://github.com/dominikh/go-errcheck.el.git
	cd $(EMACS_D_PATH)/customizations; $(GIT_BIN) clone https://github.com/hniksic/emacs-htmlize.git

$(GOBIN)/errcheck:
	$(GO_BIN) get -u github.com/kisielk/errcheck
$(GOBIN)/unconvert:
	$(GO_BIN) get -u github.com/mdempsky/unconvert
$(GOBIN)/gocode:
	$(GO_BIN) get -u github.com/nsf/gocode
$(GOBIN)/goimports:
	$(GO_BIN) get -u golang.org/x/tools/cmd/goimports
$(GOBIN)/goflymake:
	$(GO_BIN) get -u github.com/ptrv/goflycheck

go-deps: $(GO_DEPS)

$(OBJS):
	cp $(notdir $@) $@

.PHONY: deps
deps: git-repos $(EMACS_D_PATH)/.cask go-deps

.PHONY: install
install: $(EMACS_D_PATH) $(OBJS) $(EMACS_D_PATH)/init.el $(EMACS_D_PATH)/customizations deps

.PHONY: uninstall
uninstall:
	rm -rf $(EMACS_D_PATH)

.PHONY: update
update: deps

.PHONY: reinstall
reinstall: uninstall install

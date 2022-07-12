GOBIN=$(shell /usr/bin/env which go)

prerequisites:
ifeq ($(GOBINI),)
	$(error unable to find go)
endif

gopls:
	$(GOBIN) install golang.org/x/tools/gopls@latest

workspace:
	mkdir -p ~/go/{pkg,bin,src}

install: prerequisites workspace gpls


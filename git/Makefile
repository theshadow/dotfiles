BIN=$(shell /usr/bin/env which git)

prerequisites:
ifeq ($(BIN),)
	$(error git not found)
endif

install: prerequisites
	rm -f ~/.gitignore
	ln -s $(pwd)/.gitignore ~/.gitignore
	$(BIN) config --global core.excludesfile ~/.gitignore

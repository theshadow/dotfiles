GITBIN:=$(shell /usr/bin/env which git)
ZSHBIN:=$(shell /usr/bin/env which zsh)

prerequisites:
ifeq ($(GITBIN),)
	$(error unable to find git)
endif

ifeq ($(ZSHBIN),)
	$(error unable to find zsh)
endif	

zshrc:
	cat $(shell pwd)/.zshrc > ~/.zshrc

zprezto:
	$(GITBIN) clone --recursive https://github.com/sorin-ionescu/prezto.git ~/.zprezto_tmp
	mv ~/.zprezto_tmp ~/.zprezto
	cat $(shell pwd)/.zpreztorc > ~/.zpreztorc

install: prerequisites zprezto zshrc

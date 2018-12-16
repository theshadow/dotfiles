.PHONY: all
all: install

install:
	cp gitmessage ~/.gitmessage
	cp gitignore ~/.gitignore

	git config --global user.name "Xander Guzman"
	git config --global user.email "xander.guzman@xanderguzman.com"
	git config --global core.editor emacs
	git config --global commit.template ~/.gitmessage
	git config --global core.excludesfile ~/.gitignore

dmg:
	curl -fsSL https://emacsformacosx.com/emacs-builds/Emacs-28.1-4-universal.dmg


install:
	rm -f ~/.emacs
	rm -f ~/.emacs.d/init.el
	ln -s $(pwd)/init.el ~/.emacs.d/init.el
	ln -s $(pwd)/config.org ~/.emacs.d/config.org

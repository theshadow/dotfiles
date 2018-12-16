.PHONY: all
all: install

install:
	brew install rtv mpv imagemagick
	cd $(HOME); rtv --copy-mailcap
	mkdir -p $(HOME)/.config/rtv
	cp rtv.cfg $(HOME)/.config/rtv

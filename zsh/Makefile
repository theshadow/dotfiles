OBJS = $(HOME)/.zshrc $(HOME)/.zpreztorc

all: install

$(OBJS):
	cp -f $(subst .,,$(@F)) $@

install: $(OBJS)

uninstall:
	rm -f $(HOME)/.zshrc
	rm -f $(HOME)/.zpreztorc

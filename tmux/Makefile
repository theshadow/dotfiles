TMUXBIN=$(shell /usr/bin/env which tmux)

prerequisites:
ifeq ($(TMUXBIN),)
	$(error unable to find tmux)
endif

config:
	cat $(pwd)/.tmux.conf > ~/.tmux.conf


install: prerequisites config


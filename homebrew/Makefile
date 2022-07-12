PACKAGES:="git go wget tmux jq node npm sqlite telnet awscli aws-keychain"

prerequisites:

bin:
	$(shell /usr/bin/env bash) -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

install: prerequisites bin
	$(shell /usr/bin/env brew) install $(PACKAGES)


HOMEBREW_BIN=/usr/local/bin/brew
NPM_BIN=/usr/local/bin/npm
CFN_LINT_BIN=/usr/local/bin/cfn-lint

.PHONY: all
all: install

.PHONY: install
install: $(CFN_LINT_BIN)

$(CFN_LINT_BIN): $(NPM_BIN)
	npm install -g cfn-lint

$(NPM_BIN): $(HOMEBREW_BIN)
	brew install npm

$(HOMEBREW_BIN):
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew update && brew upgrade

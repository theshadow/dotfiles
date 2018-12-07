HOMEBREW_BIN=/usr/local/bin/brew
NPM_BIN=/usr/local/bin/npm
PIP_BIN=/usr/local/bin/pip
CFN_LINT_BIN=/usr/local/bin/cfn-lint

PIP_DEPS=cfn-lint
NPM_DEPS=""

.PHONY: all
all: install

.PHONY: install
install: $(CFN_LINT_BIN)

$(CFN_LINT_BIN):
	$(PIP_BIN) install cfn-lint

$(NPM_BIN): $(HOMEBREW_BIN)
	$(HOMEBREW_BIN) install npm

$(HOMEBREW_BIN):
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew update && brew upgrade

SHELL := /bin/bash
BREW := $(brew --prefix)/bin/brew

install: install-homebrew install-iterm2 create-symbolic-link

install-homebrew:
ifeq ($(shell which brew),)
	sudo curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash
else 
	@echo "brew is already installed"
endif

install-iterm2:
ifeq ($(shell brew list iTerm2 2>/dev/null),)
	BREW tap homebrew/cask-fonts
	BREW install font-meslo-for-powerline
	BREW install --cask iterm2
else
	@echo "iTerm2 is already installed"
endif

create-symbolic-link:
	@echo "Creating Defaults.json and Profiles.json as symbolic links in your iTerm2 DynamicProfiles folder..."
	@mkdir -p "$(HOME)/Library/Application Support/iTerm2/DynamicProfiles"
	@ln -sf $(PWD)/Profiles/Default.json "$(HOME)/Library/Application Support/iTerm2/DynamicProfiles/Default.json" # update the link to Default.json
	@ln -sf $(PWD)/Profiles/Profiles.json "$(HOME)/Library/Application Support/iTerm2/DynamicProfiles/Profiles.json" # update the link to Profiles.json

	@echo "Setting 'Default Shared' Profile as default..."
	@defaults write com.googlecode.iterm2 "Default Bookmark Guid" -string "6A791674-E094-4A23-B084-A03C8030D453"

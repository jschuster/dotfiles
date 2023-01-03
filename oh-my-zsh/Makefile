SHELL := /bin/bash
BREW := $(brew --prefix)/bin/brew

install: install-homebrew install-ohmyzsh install-ohmyzsh-plugins backup-existing-zshrc create-symbolic-link

install-homebrew:
ifeq ($(shell which brew),)
	sudo curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash
else 
	@echo "brew is already installed"
endif

install-ohmyzsh:
ifeq ("$(wildcard $(HOME)/.oh-my-zsh)", "")
	curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | zsh
else
	@echo "oh-my-zsh is already installed"
endif

install-ohmyzsh-plugins: install-homebrew
	@test ! -f $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh || BREW install zsh-autosuggestions
	@test ! -f $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh || BREW install zsh-syntax-highlighting


backup-existing-zshrc:
	@echo "Backing up your .zshrc if already exists..."
# || Does NOT mean OR! It means... 'execute next command if last command return code(rc) was false'
# first test will stop further execution if .zshrc DOES NOT exist
# second test will stop further execution if .zshrc IS a symbolic link
# so backup with mv will execute if file DOES exist and IS NOT a symbolic link
	@test ! -f $(HOME)/.zshrc || test -L $(HOME)/.zshrc || mv $(HOME)/.zshrc $(PWD)/zshrc.bak # Make backup of .zshrc if exists and not a symbolic link

create-symbolic-link:
	@echo "Creating .zshrc as symbolic link in your home directory..."
	@ln -sf $(PWD)/zshrc $(HOME)/.zshrc # update the link to .zshrc

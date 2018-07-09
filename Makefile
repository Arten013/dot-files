DOTFILES_EXCLUDES := .DS_Store .git .gitmodules .travis.yml
DOTFILES_TARGET   := $(wildcard .??*) bin
DOTFILES_DIR      := $(PWD)
DOTFILES_FILES    := $(filter-out $(DOTFILES_EXCLUDES), $(DOTFILES_TARGET))

all: init deploy
.PHONY: all

deploy:
	@$(foreach val, $(DOTFILES_FILES), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)

init:
	@$(DOTFILES_DIR=$(DOTFILES_DIR);echo "dtf="$DOTFILES_DIR;)
	@$(foreach val, $(wildcard ./etc/init/*.sh), bash $(val);)

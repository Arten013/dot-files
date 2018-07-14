#/bin/bash

echo "setup nvim "$DOTFILES_DIR"./.vim"

rm -rf $HOME'/.config/nvim'
mkdir -p $HOME'/.config/nvim'
ln -sfnv $DOTFILES_DIR'/.vimrc' $HOME'/.config/nvim/init.vim'

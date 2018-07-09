#/bin/bash

echo "setup nvim "$DOTFILES_DIR"./.nvim"

mkdir -p $HOME'/.config/'
rm -rf $HOME'/.config/nvim'
ln -sfnv $DOTFILES_DIR'/.nvim' $HOME'/.config/nvim'

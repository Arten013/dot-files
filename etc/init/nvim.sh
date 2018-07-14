#/bin/bash

echo "setup nvim "$DOTFILES_DIR"./.vim"

if [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
    if [ !"$(which apt)" == "" ]; then
        apt install software-properties-common

        add-apt-repository ppa:neovim-ppa/unstable
        apt update
        apt install neovim
    fi
fi
rm -rf $HOME'/.config/nvim'
mkdir -p $HOME'/.config/nvim'
ln -sfnv $DOTFILES_DIR'/.vimrc' $HOME'/.config/nvim/init.vim'

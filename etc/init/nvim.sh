#/bin/bash

echo "setup nvim "$DOTFILES_DIR"./.vim"

if test -z $(which nvim); then
    if [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
        echo "Linux OS"
        if ! test -z $(which apt); then
            apt update
            apt install -y apt-file
            apt-file update
            apt-file search add-apt-repository
            apt install -y software-properties-common
            add-apt-repository ppa:neovim-ppa/unstable
            apt update
            apt install -y neovim
        fi
    fi
fi
rm -rf $HOME'/.config/nvim'
mkdir -p $HOME'/.config/nvim'
ln -sfnv $DOTFILES_DIR'/.vimrc' $HOME'/.config/nvim/init.vim'

#/bin/bash

echo "setup nvim"
if [ ! -e $HOME'/.config/nvim/init.vim' ]; then
	mkdir -p $HOME'/.config/nvim'
	ln -s $HOME'/dotfiles/.vimrc' $HOME'/.config/nvim/init.vim'
	echo '{$HOME}/dotfiles/.vimrc -> {$HOME}/.config/nvim/init.vim'
fi

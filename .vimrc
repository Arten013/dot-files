let $XDG_VIM_HOME = $HOME.'/.vim'

set runtimepath+=$XDG_VIM_HOME
set runtimepath+=$XDG_VIM_HOME/after

runtime! init/*.vim
runtime! functions.vim

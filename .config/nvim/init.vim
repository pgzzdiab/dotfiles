if has('win32')
		set runtimepath^=~/vimfiles runtimepath+=~/vimfiles/after
endif
if has('unix')
		set runtimepath^=~/.vim runtimepath+=~/.vim/after
endif

let &packpath = &runtimepath
source ~/.vimrc

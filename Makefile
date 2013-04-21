# vim:ft=automake
#

.SUFFIXES:

VPATH= ${HOME}

all: .vimrc syntax/m4.vim bundle/vundle
	@vim +BundleInstall +qall

bundle/vundle:
	git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
	
.vimrc:
	-@ln -s ~/.vim/vimrc ~/.vimrc

syntax/m4.vim:
	curl -o $@ http://www.vim.org/scripts/download_script.php?src_id=5158

backup:
	mv ~/.vim ~/vim.bak
	mv ~/.vimrc ~/vim.bak/

# vim:ft=automake
#

.SUFFIXES:

VPATH= ${HOME}

.PHONY: all
all: .vimrc syntax/m4.vim bundle/vundle
	@vim +BundleInstall +qall

bundle/vundle:
	git clone https://github.com/gmarik/vundle.git $(HOME)/.vim/bundle/vundle
	
.vimrc:
	-@ln -s $(HOME)/.vim/vimrc $(HOME)/.vimrc

syntax/m4.vim:
	curl -o $@ http://www.vim.org/scripts/download_script.php?src_id=5158

.PHONY: clean
clean:
	@if [ -L $(HOME)/.vimrc ]; then rm $(HOME)/.vimrc; fi

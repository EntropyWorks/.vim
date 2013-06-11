# vim:ft=automake
#

HOME:= $(shell cd ~; pwd)

.SUFFIXES:

VPATH= ${HOME}

.PHONY: all
all: syntax/m4.vim bundle/vundle

.PHONY: install
install: | all ${HOME}/.vimrc
	@vim +BundleInstall +qall
	$(MAKE) check

.PHONY: check
check:
	@diff ~/.vimrc  vimrc

bundle/vundle:
	git clone https://github.com/gmarik/vundle.git $(HOME)/.vim/bundle/vundle
	
${HOME}/.vimrc: vimrc
	-@ln -s $(HOME)/.vim/vimrc $(HOME)/.vimrc

syntax/m4.vim:
	curl -o $@ http://www.vim.org/scripts/download_script.php?src_id=5158

.PHONY: clean
clean:
	@if [ -L $(HOME)/.vimrc ]; then rm $(HOME)/.vimrc; fi

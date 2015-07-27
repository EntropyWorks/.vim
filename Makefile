# vim:ft=make
#

HOME:= $(shell cd ~; pwd)
mkdir_p= mkdir -p
dirstamp= .dirstamp
EDITOR=vim

VIMRC= ${HOME}/.vimrc

.SUFFIXES:

VPATH= ${HOME}

bundle/$(dirstamp):
	@$(mkdir_p) $(@D)
	@touch $@


.PHONY: all
all: bundle/Vundle.vim
	@vim +PluginClean! +qall < `tty` > `tty`
	@vim +PluginUpdate +qall < `tty` > `tty`
	@vim +PluginInstall +qall < `tty` > `tty`
	@vim +PluginClean! +qall < `tty` > `tty`

.PHONY: install
install: ${VIMRC} all
	@$(MAKE) check

.PHONY: check
check: all
	@vim -u vimrc +qall < `tty` > `tty`
	
bundle/Vundle.vim: bundle/$(dirstamp)
	-@git clone https://github.com/gmarik/Vundle.vim.git $@

${VIMRC}: vimrc
	-@install vimrc $@

.PHONY: uninstall
uninstall: clean
	@if [ -L $(HOME)/.vimrc ]; then rm $(HOME)/.vimrc; fi

.PHONY: clean
clean:
	@vim +PluginClean! +qall < `tty` > `tty`
	@if [ -L $(HOME)/.vimrc ]; then rm $(HOME)/.vimrc; fi
	@rm -rf bundle

.DEFAULT_GOAL:= all
.NOTPARALLEL:

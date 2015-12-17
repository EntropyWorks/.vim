# vim:
#

HOME:= $(shell cd ~; pwd)
mkdir_p= mkdir -p
dirstamp= .dirstamp
EDITOR:= vim
VIM:= vim -u vimrc
VUNDLE_VIM:= bundle/Vundle.vim/$(dirstamp)
VUNDLE_REPO:= https://github.com/VundleVim/Vundle.vim.git
INSTALL_R:= install

.SUFFIXES:

VPATH:= $(HOME)
VIMRC:= $(HOME)/.vimrc

bundle/$(dirstamp):
	@$(mkdir_p) $(@D)
	@$(INSTALL_R) $< $@

.PHONY: display
display: 
	@echo $(VIMRC)

.PHONY: all
.ONESHELL:
all: $(VUNDLE_VIM)
	@$(VIM) +PluginClean! +qall < `tty` > `tty`
	@$(VIM) +PluginInstall! +qall < `tty` > `tty`
	@$(VIM) +PluginClean! +qall < `tty` > `tty`

.PHONY: install
install: | all check $(VIMRC)

.PHONY: check
check: all
	@$(VIM) +qall < `tty` > `tty`
	
$(VUNDLE_VIM): bundle/$(dirstamp)
	-@git clone $(VUNDLE_REPO) $@

.PHONY: update
update:
	@rm -rf $(VUNDLE_VIM)
	$(MAKE)

$(VIMRC): vimrc
	@$(INSTALL_R) $< $@


.ONESHELL:
all: $(VUNDLE_VIM)

.ONESHELL:
.PHONY: uninstall
uninstall: clean
	rm $(HOME)/.vimrc

.PHONY: clean
.ONESHELL:
clean:
	@vim +PluginClean! +qall < `tty` > `tty`
	@if [ -L $(HOME)/.vimrc ]; then rm $(HOME)/.vimrc; fi
	@rm -rf bundle

.DEFAULT_GOAL:= all
.NOTPARALLEL:

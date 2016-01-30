# vim:
#

HOME:= $(shell cd ~; pwd)
mkdir_p= mkdir -p
dirstamp= .dirstamp
VIMRC_VIM:= vimrc.vim
EDITOR:= vim
VIM:= vim -u $(VIMRC_VIM)
VUNDLE_VIM:= bundle/Vundle.vim/$(dirstamp)
VUNDLE_REPO:= https://github.com/VundleVim/Vundle.vim.git
INSTALL_C:= install -C
TOUCH_R:= touch -r
BUNDLE:= bundle/.vimrc_timestamp

.SUFFIXES:

VIMRC:= $(HOME)/.vimrc

bundle/$(dirstamp): /dev/null
	@$(mkdir_p) $(@D)
	@$(INSTALL_C) $< $@

colors/$(dirstamp): /dev/null
	@$(mkdir_p) $(@D)
	@$(INSTALL_C) $< $@

.PHONY: display
display: 
	@echo $(VIMRC)

.PHONY: all
.ONESHELL:
all: $(VUNDLE_VIM) $(BUNDLE)  colors/solarized.vim

bundle/vim-colors-solarized/colors/solarized.vim:
	@$(VIM) +PluginInstall! +qall < `tty` > `tty`

colors/solarized.vim: bundle/vim-colors-solarized/colors/solarized.vim colors/$(dirstamp)
	@$(INSTALL_C) $< $@

$(BUNDLE): $(VIMRC_VIM) bundle/$(dirstamp)
	@$(VIM) +PluginClean! +qall < `tty` > `tty`
	@$(VIM) +PluginInstall! +qall < `tty` > `tty`
	@$(VIM) +PluginClean! +qall < `tty` > `tty`
	@$(TOUCH_R) $< $@


.phony: install
install: | all check $(VIMRC)

.PHONY: check
check: all
	@$(VIM) +qall < `tty` > `tty`
	
$(VUNDLE_VIM): bundle/$(dirstamp)
	@git clone $(VUNDLE_REPO) $(@D)
	@$(TOUCH_R) $< $@

.PHONY: update
update:
	@rm -rf $(VUNDLE_VIM)
	$(MAKE)

$(VIMRC): $(VIMRC_VIM)
	@$(INSTALL_C) $< $@


.ONESHELL:
all: $(VUNDLE_VIM)

.ONESHELL:
.PHONY: uninstall
uninstall: clean
	@rm $(VIMRC)

.PHONY: clean
.ONESHELL:
clean:
	@vim +PluginClean! +qall < `tty` > `tty`
	@if [ -L $(VIMRC) ]; then rm $(VIMRC); fi
	@rm -rf bundle colors

.DEFAULT_GOAL:= all
.NOTPARALLEL:

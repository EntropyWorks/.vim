# vim:

HOME:= $(shell cd ~; pwd)
mkdir_p= mkdir -p
dirstamp= .dirstamp
VIMRC_VIM:= vimrc.vim
BUNDLE_VIM:= bundle.vim
EDITOR:= vim
VIM:= vim -u $(VIMRC_VIM)
VUNDLE:= bundle/Vundle.vim/README.md
VUNDLE_VIM:= bundle/Vundle.vim/$(dirstamp)
VUNDLE_REPO:= https://github.com/VundleVim/Vundle.vim.git
INSTALL_C:= install -C
TOUCH_R:= touch -r
BUNDLES:= bundle/.dirstamp

.SUFFIXES:

VIMRC:= $(HOME)/.vimrc

colors/$(dirstamp): /dev/null
	@$(mkdir_p) $(@D)
	@$(INSTALL_C) $< $@

.PHONY: display
display: 
	@echo $(VIMRC)

.PHONY: all
.ONESHELL:
all: $(VUNDLE_VIM) $(BUNDLES)

bundle/vim-colors-solarized/colors/solarized.vim:
	@$(VIM) +PluginInstall! +qall

# Dead rule
colors/solarized.vim: bundle/vim-colors-solarized/colors/solarized.vim colors/$(dirstamp)
	@$(INSTALL_C) $< $@

$(BUNDLES): $(BUNDLE_VIM)
	@$(VIM) +PluginClean! +qall
	@$(VIM) +PluginInstall! +qall
	@$(VIM) +PluginClean! +qall
	@	$(TOUCH_R) $< $@

.phony: install
install: | all check $(VIMRC) gvimrc

gvimrc: gvimrc.vim
	@$(INSTALL_C) $< $@

.PHONY: check
check: all
	@$(VIM) +qall

$(VUNDLE):
	@git clone $(VUNDLE_REPO) $(@D)
	
$(VUNDLE_VIM): $(VUNDLE)
	@$(TOUCH_R) $< $@

.PHONY: update
update:
	@rm -rf $(VUNDLE_VIM) $(BUNDLES)
	$(MAKE)

$(VIMRC): $(VIMRC_VIM)
	@$(INSTALL_C) $< $@


.ONESHELL:
all: $(VUNDLE_VIM)

.ONESHELL:
.PHONY: uninstall
uninstall: clean
	@rm $(VIMRC) gvimrc

.PHONY: clean
.ONESHELL:
clean:
	@vim +PluginClean! +qall
	@if [ -L $(VIMRC) ]; then rm $(VIMRC); fi
	@rm -rf bundle colors

.DEFAULT_GOAL:= all
.NOTPARALLEL:

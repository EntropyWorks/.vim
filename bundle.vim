" vim:set softtabstop=4 shiftwidth=4 expandtab :
filetype off      " Vundle Requirement
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
let g:vundle_default_git_proto = 'git'


" let Syntastic take its turn
Plugin 'scrooloose/syntastic'

" let Polyglot take its turn
Plugin 'sheerun/vim-polyglot'

" vim-scripts repos
Plugin 'airblade/vim-gitgutter.git'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Absolight/vim-bind.git'
Plugin 'BrianAker/dhcpd.vim'
Plugin 'BrianAker/shell-commands'
Plugin 'EasyGrep'
Plugin 'Gundo'
Plugin 'vim-scripts/gdbmgr'
Plugin 'YankRing.vim'
Plugin 'pearofducks/ansible-vim'
Plugin 'clang-complete'
Plugin 'cmdalias.vim'
" Plugin 'cpp.vim'
Plugin 'darfink/vim-plist'

" Git made easy for vim
Plugin 'fugitive.vim'

Plugin 'git-commit'
Plugin 'gnupg.vim'
Plugin 'ifdef-highlighting'
" Plugin 'ingydotnet/yaml-vim'
Plugin 'lodgeit.vim'
Plugin 'matchit.zip'
Plugin 'molokai'
Plugin 'mitsuhiko/vim-jinja'
Plugin 'myint/syntastic-extras'
Plugin 'pep8'
Plugin 'hashivim/vim-consul'
Plugin 'hashivim/vim-nomadproject'
Plugin 'hashivim/vim-ottoproject'
Plugin 'hashivim/vim-packer'
Plugin 'hashivim/vim-terraform'
Plugin 'hashivim/vim-vagrant'
Plugin 'hashivim/vim-vaultproject'
Plugin 'justinmk/vim-syntax-extra'
" Plugin 'ruby.vim'
Plugin 'saltstack/salt-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'snipMate'
Plugin 'sqlite_c'
Plugin 'SudoEdit.vim'
Plugin 'vim-ctrlspace/vim-ctrlspace'
Plugin 'tabman.vim'
Plugin 'taglist.vim'
Plugin 'tpope/vim-pastie'
Plugin 'tpope/vim-speeddating'
Plugin 'vim-scripts/a.vim'
Plugin 'vim-scripts/c.vim'
Plugin 'vim-scripts/csv.vim'
Plugin 'vim-scripts/syntaxm4.vim'
Plugin 'xmledit'
" Color I use
Plugin 'altercation/vim-colors-solarized'
" Alternate color coding
Plugin 'twerth/ir_black'
Plugin 'junegunn/vader.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

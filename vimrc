set guifont=9x15
set nocompatible

filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

" vim-scripts repos
Bundle 'BrianAker/shell-commands'
Bundle 'EasyGrep'
Bundle 'a.vim'
Bundle 'git-commit'
Bundle 'fugitive.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'git://repo.or.cz/vcscommand'
Bundle 'git@github.com:tpope/vim-markdown.git'
Bundle 'yaml.vim'
Bundle 'c.vim'
Bundle 'cpp.vim'
Bundle 'vim-ruby'

filetype plugin indent on     " required!

set nowrap
set tabstop=8
set shiftwidth=2
set autowrite " please vim to save file any time i go to the command mode
set bs=2
set et
set sts=2
syn on
set modelines&
set hlsearch
set wildignore=*.o,*.lo
set incsearch
set showmatch
set hidden " let hide unwritten buffers
set showcmd " show uncomplete command
set title " set xterm title to current file
set titleold=xterm " if title can not be restored, set it to this value
"set list
"set nostartofline
"set wildmenu
"set rulerformat=%30(%<%m%y%h%r%=%l,%c\ %P%)
set ruler
set ai
set si
set nosol
"set cino=(4
set cino+=(0
set mps+=<:>
if has("autocmd")
" Added for cpp
	filetype plugin indent on
" In text files, always limit the width of text to 78 characters
	autocmd BufRead *.yy  source $VIMRUNTIME/syntax/yacc.vim
	autocmd BufRead *.yy  source $VIMRUNTIME/indent/yacc.vim
	autocmd BufRead *.test set syntax=mysql_test     
	autocmd BufRead *.pccts set syntax=pccts
" When editing a file, always jump to the last cursor position
	autocmd BufReadPost * if line("'\"") && line("'\"") <= line("$") | exe "normal `\"" | endif
endif
	
nmap _dos :%s/\r//g<C-j>

set path=**2
set mousehide		" Hide the mouse when typing text
" function for smart intdenting with tab in insert mode
function InsertTabWrapper()
	let col = col('.') - 1
	if !col || getline('.')[col - 1] !~ '\k'
		return "\<tab>"
	else
		return "\<c-p>"
	endif
endfunction
set visualbell t_vb=
" print warning message for Ex mode 
function WarningExModeDisabled()
	echohl WarningMsg
	echo "Ex mode disabled"
	echohl None
endfunction

au BufNewFile,BufRead *.i set filetype=swig 
au BufNewFile,BufRead *.swg set filetype=swig 


" remap Q to not switch to Ex mode 
nmap Q :call WarningExModeDisabled()<CR>
nmap gQ :call WarningExModeDisabled()<CR>
" vim:noet:ts=8:sw=8:sts=8

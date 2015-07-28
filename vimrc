set guifont=9x15
set nocompatible  " be iMproved, required for Vundle

if has("autocmd")
  filetype off      " Vundle Requirement

  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()

  " let Vundle manage Vundle, required
  Plugin 'gmarik/Vundle.vim'

  " vim-scripts repos
  Plugin 'Absolight/vim-bind.git'
  Plugin 'BrianAker/dhcpd.vim'
  Plugin 'BrianAker/shell-commands'
  Plugin 'EasyGrep'
  Plugin 'Gundo'
  Plugin 'YankRing.vim'
  Plugin 'chase/vim-ansible-yaml'
  Plugin 'clang-complete'
  Plugin 'cpp.vim'
  Plugin 'darfink/vim-plist'
  Plugin 'fugitive.vim'
  Plugin 'git-commit'
  Plugin 'gnupg.vim'
  Plugin 'ifdef-highlighting'
  Plugin 'ingydotnet/yaml-vim'
  Plugin 'lodgeit.vim'
  Plugin 'matchit.zip'
  Plugin 'mitsuhiko/vim-jinja'
  Plugin 'myint/syntastic-extras'
  Plugin 'pep8'
  Plugin 'robbevan/Vagrantfile.vim'
  Plugin 'ruby.vim'
  Plugin 'saltstack/salt-vim'
  Plugin 'scrooloose/nerdtree'
  Plugin 'scrooloose/syntastic'
  Plugin 'snipMate'
  Plugin 'sqlite_c'
  Plugin 'sudo.vim'
  Plugin 'tabman.vim'
  Plugin 'taglist.vim'
  Plugin 'tpope/vim-markdown'
  Plugin 'tpope/vim-pastie'
  Plugin 'tpope/vim-speeddating'
  Plugin 'vcsbzr.vim'
  Plugin 'vcscommand.vim'
  Plugin 'vcsnursery'
  Plugin 'vim-scripts/a.vim'
  Plugin 'vim-scripts/c.vim'
  Plugin 'vim-scripts/syntaxm4.vim'
  "
  " All of your Plugins must be added before the following line
  " Plugin 'git://github.com/seveas/bind.vim.git'
  " Plugin 'git://repo.or.cz/vcscommand'
  " Plugin 'refactor'
  " Plugin 'tomtom/checksyntax_vim'
  " Plugin 'tomtom/quickfixsigns_vim'
  " Plugin 'vcslogdiff'
  call vundle#end()            " required
  filetype plugin indent on    " required
endif

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
au BufNewFile,BufRead *.j2 set filetype=jinja

" remap Q to not switch to Ex mode 
nmap Q :call WarningExModeDisabled()<CR>
nmap gQ :call WarningExModeDisabled()<CR>
" vim:noet:ts=8:sw=8:sts=8
"
map  :Lodgeit<CR> 


if has("autocmd")
  " BEGIN syntax/m4.vim
  let g:m4_default_quote="`,'" 
  let g:m4_default_comment='#' 
  " END syntax/m4.vim
   
  " BEGIN vim-markdown
  let g:vim_markdown_folding_disabled=1
  " END vim-markdown

  " BEGIN Syntastic configuration
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*

  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_auto_loc_list = 1
  let g:syntastic_check_on_open = 1
  let g:syntastic_check_on_wq = 0
  "  Extras
  let g:syntastic_cfg_checkers = ['cfg']
  let g:syntastic_dosini_checkers = ['dosini']
  let g:syntastic_make_checkers = ['gnumake']
  let g:syntastic_javascript_checkers = ['json_tool']
  let g:syntastic_gitcommit_checkers = ['language_check']
  let g:syntastic_svn_checkers = ['language_check']
  " chase/ansible
  let g:ansible_options = {'ignore_blank_lines': 0}
  " End Syntastic configuration
endif

set nofoldenable    " disable folding

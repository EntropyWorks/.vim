" vim:set softtabstop=4 shiftwidth=4 expandtab :
set nocompatible  " be iMproved, required for Vundle

" Default tab spacing
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set smartindent
set nowrap

" Default tab spacing
set tabstop=2
set shiftwidth=2
set expandtab

if has('gui_running')
    if has('gui_mac')
        set guifont=Menlog Regular:h14
    endif
endif

if has("autocmd")
    filetype off      " Vundle Requirement

    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()

    " let Vundle manage Vundle, required
    Plugin 'VundleVim/Vundle.vim'

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
    Plugin 'xmledit'
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

vsplit

if has("macunix")
    set makeprg=gmake
endif

set autowrite " please vim to save file any time i go to the command mode
set backspace=indent,eol,start
" set sts=2
syn on
set modelines&
set hlsearch
set wildignore=*.o,*.lo,*.swp,*.bak,*.pyc,*.class
set incsearch
set showmatch
set hidden " let hide unwritten buffers
set showcmd " show uncomplete command
set title " set xterm title to current file
set titleold=xterm " if title can not be restored, set it to this value
set ruler
set nostartofline
"set cino=(4
"set cino+=(0
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
set mousehide           " Hide the mouse when typing text
" function for smart intdenting with tab in insert mode
"function InsertTabWrapper()
"    let col = col('.') - 1
"    if !col || getline('.')[col - 1] !~ '\k'
"        return "\<tab>"
"    else
"        return "\<c-p>"
"    endif
"endfunction
set visualbell t_vb=
" print warning message for Ex mode 
"function WarningExModeDisabled()
"    echohl WarningMsg
"    echo "Ex mode disabled"
"    echohl None
"endfunction

" autocmd BufNewFile,BufRead *.i set filetype=swig 
" autocmd BufNewFile,BufRead *.swg set filetype=swig 
" autocmd BufNewFile,BufRead *.j2 set filetype=jinja

" remap Q to not switch to Ex mode 
" nmap Q :call WarningExModeDisabled()<CR>
" nmap gQ :call WarningExModeDisabled()<CR>
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
    let g:syntastic_quiet_messages = { 'regex': 'SC2148' }
    " chase/ansible
    let g:ansible_options = {'ignore_blank_lines': 0}
    " End Syntastic configuration
endif

set nofoldenable    " disable folding

" sudo for root owned files
cmap w!! w !sudo tee % >/dev/null

" Mix opinion on
" set noswapfile
set nobackup

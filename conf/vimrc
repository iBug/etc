" File: $HOME/.vimrc
" Author: iBug
" Date: Apr 2, 2022
" Description: iBug's Vim RC file
" Vim: 8.2

set nocompatible
set timeoutlen=500 ttimeoutlen=50
set showcmd number ruler background=dark showmatch
set autoindent cindent smartindent
set tabstop=4 shiftwidth=4 softtabstop=4 smarttab expandtab
set wrapscan ignorecase incsearch hlsearch
set whichwrap+=<,>,[,]
set backspace=2 laststatus=2
set foldenable foldmethod=manual
set formatoptions-=cro
set autoread nobackup noswapfile confirm
set linebreak
set magic iskeyword+=_
set mouse=a selection=exclusive selectmode=mouse,key
set autoread

map q <NOP>
map Q <NOP>
map <M-v> <C-v>
let mapleader="!"

autocmd FileType sh,javascript,html,htmldjango,liquid,css,scss,yaml,ruby,vb,sql,sshconfig,vue set tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType html,htmldjango,go,make,text set noexpandtab
autocmd FileType css,sass,scss,liquid set expandtab
autocmd FileType markdown,liquid syntax sync minlines=9999
autocmd FileType asm set tabstop=8 shiftwidth=8 softtabstop=8 noexpandtab
autocmd FileType * set formatoptions-=cro formatoptions+=m
autocmd BufWritePre * :%s/^\s\+$//e "Only trim empty lines

syntax on
filetype plugin indent on

autocmd BufWritePost *.go :call GoFmt()
function GoFmt()
  if executable("goimports")
    silent !goimports -w % >/dev/null 2>&1
  elseif executable("gofmt")
    silent !gofmt -w % >/dev/null 2>&1
  endif
  e!
endfunction

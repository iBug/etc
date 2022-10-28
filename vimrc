" File: $HOME/.vimrc
" Made by iBug
" Jun 10, 2022
" iBug's Vim RC file
" Vim 8.2

set nocompatible
set viminfo='100,<100,s32,h
set timeoutlen=500 ttimeoutlen=50
set showcmd number ruler showmatch
set background=dark termguicolors
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
set autoread nocursorline nocursorcolumn
syntax on
filetype plugin indent on

" if has("termguicolors")
"   let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"   let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
" endif

if isdirectory(expand('~/.vim/bundle/Vundle.vim', ':p'))
  filetype off
  set runtimepath+=~/.vim/bundle/Vundle.vim
  call vundle#begin()
  let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
  let g:ycm_clangd_binary_path='/usr/bin/clangd'
  Plugin 'tabnine/YouCompleteMe'
  call vundle#end()
  filetype plugin indent on
  set completeopt-=preview
endif

map q <NOP>
map Q <NOP>
map <M-v> <C-v>
let mapleader="!"

autocmd FileType sh,bash,javascript,json,toml,html,htmldjango,liquid,css,scss,yaml,ruby,vb,sql,sshconfig,pug,vue set tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType html,htmldjango,go,make,text set noexpandtab
autocmd FileType css,sass,scss,liquid set expandtab
autocmd FileType markdown,liquid syntax sync minlines=9999
autocmd FileType asm set tabstop=8 shiftwidth=8 softtabstop=8 noexpandtab
autocmd FileType * set formatoptions-=cro formatoptions+=m
autocmd BufWritePre * :%s/^\s\+$//e " Only trim empty lines

let g:pyindent_open_paren=shiftwidth()

autocmd BufWritePost *.go :call GoFmt()
function GoFmt()
  if executable("goimports")
    silent !goimports -w % >/dev/null 2>&1
  elseif executable("gofmt")
    silent !gofmt -w % >/dev/null 2>&1
  endif
  e!
endfunction

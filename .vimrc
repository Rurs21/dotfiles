" No vi compatibility
set nocompatible

filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
    Plugin 'VundleVim/Vundle.vim'
    Plugin 'vim-airline/vim-airline'
    Plugin 'vim-airline/vim-airline-themes'
    Plugin 'preservim/nerdtree'
call vundle#end()            " required

"Syntax highlighting
syntax on

"Show line numbers
set number

".Blink cursor on error (No beeping)
set visualbell

"Encoding
set encoding=utf-8

"Color scheme
colorscheme nord

"AirLine Theme
let g:airline_theme='term'

set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

filetype indent plugin on

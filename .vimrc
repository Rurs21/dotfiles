" No vi compatibility
set nocompatible

filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
    Plugin 'VundleVim/Vundle.vim'
    Plugin 'preservim/nerdtree'

    Plugin 'vim-airline/vim-airline'
    Plugin 'vim-airline/vim-airline-themes'
    let g:airline_theme='term'

    Plugin 'jaxbot/semantic-highlight.vim'
    let g:semanticTermColors = [28,1,2,3,38,117,31,7,25,9,10,34,45,13,14,15,3,197,124,19]

    Plugin 'Valloric/YouCompleteMe'
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
colorscheme yuki
"set termguicolors
"highlight Normal guibg=NONE ctermbg=NONE
"highlight LineNr guibg=NONE ctermbg=NONE

set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

filetype indent plugin on

set nocompatible

filetype on
filetype plugin on
filetype indent on

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
    Plugin 'VundleVim/Vundle.vim'
    Plugin 'preservim/nerdtree'
    map <C-n> :NERDTreeToggle<CR>
    Plugin 'Xuyuanp/nerdtree-git-plugin'

    Plugin 'vim-airline/vim-airline'
    Plugin 'vim-airline/vim-airline-themes'
    let g:airline_theme='term'

    let g:cpp_class_scope_highlight = 1
    let g:cpp_class_decl_highlight = 1
    let g:cpp_member_variable_highlight = 1
    Plugin 'octol/vim-cpp-enhanced-highlight'

    "Plugin 'jaxbot/semantic-highlight.vim'
    "let g:semanticTermColors = [28,1,2,3,38,117,31,7,25,9,10,34,45,13,14,15,3,197,124,19]

    "Plugin 'Valloric/YouCompleteMe'
call vundle#end()            " required

syntax on
set number
set ruler
set visualbell
set encoding=utf-8
set modifiable

let g:rehash256 = 1
colorscheme monokaii
"set termguicolors
autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE
autocmd ColorScheme * highlight LineNr ctermbg=NONE guibg=NONE
autocmd ColorScheme * highlight NonText ctermbg=NONE guibg=NONE
autocmd ColorScheme * highlight TabLine ctermbg=NONE guibg=NONE
autocmd ColorScheme * highlight TabLineFill ctermbg=NONE guibg=NONE
autocmd ColorScheme * highlight TabLineSel ctermbg=NONE guibg=NONE

set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0

let &t_ut=''

set nocompatible

call plug#begin('~/.vim/plugged')
    Plug 'preservim/nerdtree'
    map <C-n> :NERDTreeToggle<CR>
    Plug 'Xuyuanp/nerdtree-git-plugin'

    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    let g:airline_theme='term'

    Plug 'octol/vim-cpp-enhanced-highlight'
    let g:cpp_class_scope_highlight = 1
    let g:cpp_class_decl_highlight = 1
    let g:cpp_member_variable_highlight = 1
call plug#end()

syntax on
set number
set ruler
set visualbell
set encoding=utf-8
set modifiable

let g:rehash256 = 1
colorscheme molokai
"set termguicolors
autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE
autocmd ColorScheme * highlight LineNr ctermbg=NONE guibg=NONE
autocmd ColorScheme * highlight NonText ctermbg=NONE guibg=NONE
autocmd ColorScheme * highlight TabLine ctermbg=NONE guibg=NONE
autocmd ColorScheme * highlight TabLineFill ctermbg=NONE guibg=NONE
autocmd ColorScheme * highlight TabLineSel ctermbg=NONE guibg=NONE

set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0
autocmd FileType c set shiftwidth=8

let &t_ut=''

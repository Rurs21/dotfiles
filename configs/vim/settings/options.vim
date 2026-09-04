" not Vi compatible (useless ?)
set nocompatible

" Time waited for key sequence
set timeoutlen=1500

" Disable mouse
set mouse=""

" Line Numbers
set number
set relativenumber

" Ruler
set ruler

" Tabs & Indentation
set smartindent
set tabstop=4
set shiftwidth=4

" Keyword for snake_case
set iskeyword-=_

" List characters
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,eol:$,nbsp:·

" Line Wrapping
set nowrap

" Format Options
set formatoptions-=cro

" Search Settings
set hlsearch
set incsearch

" Cursor Line
set cursorline

" Appearance
set termguicolors
set noshowmode
set signcolumn=yes
set guicursor=""
set scrolloff=10
set colorcolumn=80

" Behaviour
set visualbell

" Vim persistent undo directory. Neovim overrides this in core/options.lua.
" TODO: on Vim 9.2+, undodir defaults to XDG state dir already; drop this.
let &undodir = $STATE_HOME . '/vim/undo'
call mkdir(&undodir, 'p', 0700)
set undofile

" Keep .viminfo out of $HOME
" TODO: on Vim 9.2+, viminfofile defaults to XDG state dir already; drop this.
call mkdir($STATE_HOME . '/vim', 'p', 0700)
set viminfofile=$STATE_HOME/vim/viminfo

" Files stuff
set isfname+=@-@
set updatetime=50
set noswapfile
set nobackup
set nowritebackup

filetype plugin indent on
set omnifunc=syntaxcomplete#Complete

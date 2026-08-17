let mapleader = " "
let maplocalleader = "\\"

" prevent Space from moving the cursor before a leader mapping is completed
nnoremap <silent> <Space> <Nop>

" built-in file explorer
nnoremap <silent> <leader>pv <Cmd>Explore<CR>

" disable arrow keys
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>

xnoremap <Up> <Nop>
xnoremap <Down> <Nop>
xnoremap <Left> <Nop>
xnoremap <Right> <Nop>

" leave out the inoremap declarations so arrows continue working in insert mode

" move lines
nnoremap <silent> <A-j> <Cmd>move .+1<CR>==
nnoremap <silent> <A-k> <Cmd>move .-2<CR>==
xnoremap <silent> <A-j> :move '>+1<CR>gv=gv
xnoremap <silent> <A-k> :move '<-2<CR>gv=gv

" toggle light/dark background
function! ToggleBackground() abort
    let &background = &background ==# 'dark' ? 'light' : 'dark'
endfunction

nnoremap <silent> <leader>tt <Cmd>call ToggleBackground()<CR>

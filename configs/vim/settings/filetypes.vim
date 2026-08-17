" signal a modern POSIX shell support to plugins/syntax
let g:is_posix = 1

augroup shared_filetypes
    autocmd!
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
    autocmd FileType make setlocal noexpandtab shiftwidth=8 softtabstop=0
    autocmd FileType c setlocal shiftwidth=8
augroup END

function! ApplyColorscheme() abort
    let scheme = &background ==# 'light' ? 'habaurora' : 'molokai'

    if get(g:, 'colors_name', '') !=# scheme
        execute 'colorscheme ' . scheme
    endif
endfunction

augroup dynamic_colorscheme
    autocmd!
    autocmd OptionSet background call ApplyColorscheme()
    autocmd TermResponseAll background call ApplyColorscheme()
augroup END

call ApplyColorscheme()


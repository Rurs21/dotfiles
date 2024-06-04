set laststatus=2

function! SetStatusLineHighLights()
  if &background == 'dark'
	highlight Statusline guifg=#ffffff guibg=#808080 cterm=NONE
    highlight StatuslineNormal guifg=#ffffff guibg=#008000 ctermfg=white ctermbg=green cterm=bold
    highlight StatuslineInsert guifg=#000000 guibg=#ffff00 ctermfg=black ctermbg=yellow cterm=bold
    highlight StatuslineVisual guifg=#ffffff guibg=#5f00af ctermfg=white ctermbg=darkmagenta cterm=bold
    highlight StatuslineReplace guifg=#ffffff guibg=#d70000 ctermfg=white ctermbg=red cterm=bold
    highlight StatuslineCommand guifg=#ffffff guibg=#af005f ctermfg=white ctermbg=magenta cterm=bold
  else
	highlight Statusline guifg=#000000 guibg=#d3d3d3 cterm=NONE
    highlight StatuslineNormal guifg=#000000 guibg=#008000 ctermfg=black ctermbg=green cterm=bold
    highlight StatuslineInsert guifg=#000000 guibg=#ffff00 ctermfg=black ctermbg=yellow cterm=bold
    highlight StatuslineVisual guifg=#000000 guibg=#5f00af ctermfg=black ctermbg=darkmagenta cterm=bold
    highlight StatuslineReplace guifg=#000000 guibg=#d70000 ctermfg=black ctermbg=red cterm=bold
    highlight StatuslineCommand guifg=#000000 guibg=#af005f ctermfg=black ctermbg=magenta cterm=bold
  endif
endfunction

autocmd OptionSet background call SetStatusLineHighLights()
autocmd ColorScheme * call SetStatusLineHighLights()
call SetStatusLineHighLights()

function! StatuslineMode()
  let l:mode = mode()
  if l:mode ==# 'n'
    return '%#StatuslineNormal# NORMAL '
  elseif l:mode ==# 'i'
    return '%#StatuslineInsert# INSERT '
  elseif l:mode ==# 'v' || l:mode ==# 'V' || l:mode ==# ''
    return '%#StatuslineVisual# VISUAL '
  elseif l:mode ==# 'R'
    return '%#StatuslineReplace# REPLACE '
  elseif l:mode ==# 'c'
    return '%#StatuslineCommand# COMMAND '
  else
    return '%#StatuslineNormal# UNKNOWN '
  endif
endfunction

set statusline=%{%StatuslineMode()%}\ 
set statusline+=%#Statusline#
set statusline+=\ %f
set statusline+=\ %h%m%r
set statusline+=\ %=
set statusline+=\ %y
set statusline+=\ %=%-14.(%l,%c%V%)
set statusline+=\ %P


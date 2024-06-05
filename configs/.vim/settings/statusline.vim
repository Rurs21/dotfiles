set laststatus=2

function! SetStatusLineHighLights()
  if &background == 'dark'
	highlight Statusline guifg=#ffffff guibg=#404040 cterm=NONE
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
    return 'NORMAL'
  elseif l:mode ==# 'i'
    return 'INSERT'
  elseif l:mode ==# 'v' || l:mode ==# 'V' || l:mode ==# ''
    return 'VISUAL'
  elseif l:mode ==# 'R'
    return 'REPLACE'
  elseif l:mode ==# 'c'
    return 'COMMAND'
  else
    return 'UNKNOWN'
  endif
endfunction

function! ModeHightlight()
	let l:mode = StatuslineMode()
	if l:mode ==# 'UNKNOWN'
		return '%#StatuslineNormal#'
	endif
	let l:mode = substitute(l:mode,'\(\<\w\+\>\)', '\u\1', 'g')
	return '%#Statusline' . l:mode . '#'
endfunction

set statusline=%{%ModeHightlight()%}\ %{%StatuslineMode()%}\ %#Statusline#
set statusline+=\ %t\ %h%m%r
set statusline+=\ %=
set statusline+=\ %{&fileencoding}\ │
set statusline+=\ %{&fileformat}\ │
set statusline+=\ %y
set statusline+=\ %{%ModeHightlight()%}\ %-10.(%l,%c%V%)


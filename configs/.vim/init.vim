" init vim 
source ~/.vim/settings/options.vim
source ~/.vim/settings/keymaps.vim
source ~/.vim/settings/statusline.vim

if has('nvim')
	let g:vim_home = expand('~/.vim')
else
	source ~/.vim/settings/plugins.vim 
endif

let hour = str2nr(strftime("%H"))
if hour >= 6 && hour < 18
	silent! colorscheme habaurora	
else
	silent! colorscheme molokai
endif

autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0
autocmd FileType c set shiftwidth=8

" Prevent screen clearing issues in certain terminals
let &t_ut=''


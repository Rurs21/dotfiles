" init vim 
source ~/.vim/settings/options.vim
source ~/.vim/settings/keymaps.vim

if has('nvim')
	let g:vim_home = expand('~/.vim')
else
	echom "It's ViM :|"
	source ~/.vim/settings/plugins.vim 
endif

silent! colorscheme molokai

autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0
autocmd FileType c set shiftwidth=8

" Prevent screen clearing issues in certain terminals
let &t_ut=''


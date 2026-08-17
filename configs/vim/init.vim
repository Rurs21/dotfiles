" shared baseline for Vim and Neovim
source ~/.config/vim/settings/options.vim
source ~/.config/vim/settings/keymaps.vim
source ~/.config/vim/settings/filetypes.vim
source ~/.config/vim/settings/statusline.vim

set runtimepath+=~/.config/vim

if has('nvim')
	let g:vim_home = expand('~/.config/vim')
	finish
endif

" load vim specific plugins
source ~/.config/vim/settings/plugins.vim

" follow the terminal/system appearance
source ~/.config/vim/settings/colors.vim

" Prevent screen clearing issues in certain terminals
let &t_ut=''


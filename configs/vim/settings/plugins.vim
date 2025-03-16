call plug#begin('~/.config/vim/plugged')

	" fuzzy finder
	"let $FZF_DEFAULT_COMMAND = 'rg --files --hidden -g "!.git" '
	"let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -f -g'
	Plug '/usr/local/opt/fzf'
	Plug 'junegunn/fzf.vim'
	nmap <leader>pf :Files<CR>
	nmap <leader>ps :RG<CR>

	" Colorschemes
	Plug 'NLKNguyen/papercolor-theme'
	Plug 'habamax/vim-habamax', { 'as': 'habamax' }
	Plug 'habamax/vim-habaurora', { 'as': 'habaurora' }
	Plug 'catppuccin/vim', { 'as': 'catppuccin' }
	Plug 'tomasr/molokai'
	let g:rehash256 = 1

	Plug 'octol/vim-cpp-enhanced-highlight'
	let g:cpp_class_scope_highlight = 1
	let g:cpp_class_decl_highlight = 1
	let g:cpp_member_variable_highlight = 1

	Plug 'rust-lang/rust.vim'

	Plug 'dense-analysis/ale'
	let g:ale_linters = {
				\ 'rust': ['analyzer'],
				\}
	let g:ale_fixers = {
				\ '*': ['remove_trailing_lines', 'trim_whitespace'],
				\ 'rust': ['RustFmt']
				\}

	Plug 'pangloss/vim-javascript'
	let g:javascript_plugin_jsdoc = 1

	Plug 'digitaltoad/vim-pug'
call plug#end()


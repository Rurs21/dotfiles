call plug#begin($DATA_HOME . '/vim/plugged')

	" fuzzy finder
	Plug 'junegunn/fzf'
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

	Plug 'pangloss/vim-javascript'
	let g:javascript_plugin_jsdoc = 1

	Plug 'digitaltoad/vim-pug'

	Plug 'lervag/vimtex', { 'tag': 'v2.17' }
	let g:vimtex_compiler_latexmk = { 'aux_dir': '.aux', 'out_dir': '' }

call plug#end()

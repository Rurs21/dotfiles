call plug#begin('~/.vim/plugged')
	" Colorscheme
	Plug 'tomasr/molokai'
	let g:rehash256 = 1

	"    Plug 'preservim/nerdtree'
	"    map <C-n> :NERDTreeToggle<CR>
	Plug 'Xuyuanp/nerdtree-git-plugin'

	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	let g:airline_theme='term'

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


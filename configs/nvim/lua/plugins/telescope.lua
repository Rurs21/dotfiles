return {
	'nvim-telescope/telescope.nvim', tag = '0.1.6',
	dependencies = { 'nvim-lua/plenary.nvim' },
	config = {
		pickers = {
			find_files = {
				follow = true
			}
		}
	}
}


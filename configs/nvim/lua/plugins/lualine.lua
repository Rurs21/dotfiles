return {
	'nvim-lualine/lualine.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	opts = {
		options = {
			theme = "monokai-nightasty",
			component_separators = '│',
			section_separators = { left = '', right = ''},
		},
		sections = {
			lualine_a = {'mode'},
			lualine_b = {'branch', 'diff', 'diagnostics'},
			lualine_c = {'filename'},
			lualine_x = {'encoding',  {'fileformat',icons_enabled = false}, 'filetype'},
			lualine_y = {'filesize'},
			lualine_z = {'location'}
		},

	}
}


return {
	'nvim-telescope/telescope.nvim', tag = '0.1.6',
	dependencies = { 'nvim-lua/plenary.nvim' },
	keys = {
		{ "<leader>pf", "<cmd>Telescope find_files<cr>", desc = "Telescope find files" },
		{ "<C-p>", "<cmd>Telescope git_files<cr>", desc = "Telescope git files" },
	},
	opts = {
		pickers = {
			find_files = {
				follow = true,
				hidden = true,
				file_ignore_patterns = { ".git/", "node_modules/", ".DS_Store" },
			},
		}
	}
}


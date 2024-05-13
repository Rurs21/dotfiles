local builtin = nil

return {
	'nvim-telescope/telescope.nvim', tag = '0.1.6',
	lazy = true,
	dependencies = { 'nvim-lua/plenary.nvim' },
	keys = {
		{ "<leader>pf", "<cmd>Telescope find_files<cr>", desc = "Telescope find files" },
		{ "<C-p>", "<cmd>Telescope git_files<cr>", desc = "Telescope git files" },
		{
			"<leader>ps",
			function()
				builtin.grep_string({ search = vim.fn.input("Grep > ") })
			end,
			desc = "Telescope grep string"
		},
	},
	opts = {
		pickers = {
			find_files = {
				follow = true,
				hidden = true,
				file_ignore_patterns = { ".git/", "node_modules/", ".DS_Store" },
			},
		}
	},
	config = function(_, opts)
		local telescope = require('telescope')
		telescope.setup(opts)
		builtin = telescope.builtin
	end
}


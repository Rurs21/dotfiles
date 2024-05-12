local builtin = nil
local function load_telescope_builtin()
	if builtin == nil then
		builtin = require('telescope.builtin')
	end
end

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
				load_telescope_builtin()
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
	}
}


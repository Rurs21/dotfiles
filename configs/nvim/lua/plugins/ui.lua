return {
	{
		'nvim-lualine/lualine.nvim',
		event = "VeryLazy",
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		opts = {
			options = {
				--theme = "monokai-nightasty",
				component_separators = '│',
				section_separators = { left = '', right = ''},
			},
			sections = {
				lualine_a = {'mode'},
				lualine_b = {'branch', 'diff', 'diagnostics'},
				lualine_c = {
					{'buffers', icons_enabled = false},
				},
				lualine_x = {'encoding',  {'fileformat',icons_enabled = false}, {'filetype', icons_enabled = false } },
				lualine_y = {'filesize'},
				lualine_z = {'location'}
			},
		}
	},

	-- file tree explorer
	{
		enabled = false,
		"nvim-neo-tree/neo-tree.nvim", branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			"3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		},
		keys = {
			{ "<leader>t", "<cmd>Neotree left toggle<cr>", desc = "Toggle Neo Tree left panel" }
		},
		opts = {
			filesystem = {
				hijack_netrw_behavior = "disabled"
			}
		}
	}
}


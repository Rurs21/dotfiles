return {

	-- automatically changes the editor appearance based on system settings.
	-- default behavior is to set nvim background option to dark or light
	{
		"f-person/auto-dark-mode.nvim",
		enabled = true,
		lazy = false,
		priority = 1000,
		opts = {
			update_interval = 1500,
		},
	},

	{
		"polirritmico/monokai-nightasty.nvim",
		enabled = true,
		lazy = false,
		priority = 1000,
		opts = {
			-- background : default, dark, transparent, #color
			dark_style_background = "transparent",
			light_style_background = "transparent",
			color_headers = true, -- Enable header colors for each header level (h1, h2, etc.)
		},
		config = function(_, opts)
			-- Highlight line at the cursor position
			-- vim.opt.cursorline = true

			require("monokai-nightasty").load(opts)
		end
	},

	{
		"scottmckendry/cyberdream.nvim",
		enabled = false,
		lazy = false,
		priority = 1000,
		opts = {
			transparent = true,
			italic_comments = true,
			theme = {
				variant = "default"
			}
		}
	}
}


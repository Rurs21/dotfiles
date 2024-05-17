local scheme = 'monokai-nightasty'

return {
	"f-person/auto-dark-mode.nvim",
	enabled = true,
	lazy = false,
	opts = {
		update_interval = 500,
		set_dark_mode = function()
			vim.api.nvim_set_option("background", "dark")
			vim.cmd("colorscheme " .. scheme)
		end,
		set_light_mode = function()
			vim.api.nvim_set_option("background", "light")
			vim.cmd("colorscheme " .. scheme)
		end,
	},
}


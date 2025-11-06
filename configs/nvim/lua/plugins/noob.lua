return {
	-- help establish good command workflow and habit
	{
		"m4xshen/hardtime.nvim",
		event = "VeryLazy",
		cmd = "Hardtime",
		dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
		opts = {}
	},

	-- assists with discovering motions (show hints)
	{
		"tris203/precognition.nvim",
		event = "VeryLazy",
		opts = {
			showBlankVirtLine = false,
		},
		config = function(_,opts)
			vim.api.nvim_set_hl(0, 'Precognition', { fg = '#3CB371', bg = 'none', italic = false, bold = true })
			opts.highlightColor = { link = 'Precognition' }
			require('precognition').setup(opts)
		end
	}
}


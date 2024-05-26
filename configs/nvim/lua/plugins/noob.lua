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
		opts = {}
	}
}


local commands = {
	toogle = function() 
		vim.cmd('Hardtime toogle')
		require("precognition").toggle()
		vim.cmd('echo "Noob plugin toogle !" | redraw')
	end,
}

vim.api.nvim_create_user_command('Noob', function(args)
	if commands[args.args] then
		commands[args.args]()
	end
end,
{
	nargs = 1,
	complete = function() return { 'toogle' } end,
})

return {
	-- help establish good command workflow and habit
	{
		"m4xshen/hardtime.nvim",
		cmd = "Hardtime",
		dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
		opts = {}
	},

	-- assists with discovering motions (show hints)
	{
		"tris203/precognition.nvim",
		opts = {},
		config = function(_,opts)
		end

	}
}


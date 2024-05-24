local function is_cwd_git_repo()
	local path = vim.loop.cwd() .. "/.git"
	local ok, err = vim.loop.fs_stat(path)
	if not ok then
		return false
	else
		return true
	end
end

return {
	{
		'tpope/vim-fugitive',
		cond = is_cwd_git_repo,
		keys = {
			{ "<leader>gs", "<cmd>Git<cr>", desc = "Git" },
		}
	},

	{
		"lewis6991/gitsigns.nvim",
		event = "BufNew",
		cond = is_cwd_git_repo,
		opts = {},
	}
}


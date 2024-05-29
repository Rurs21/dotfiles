local function is_git_buffer()
	local path = vim.api.nvim_buf_get_name(0)
	path = vim.fn.shellescape(path)
	local git_cmd = "git ls-files --error-unmatch " .. path
	local handle = io.popen(git_cmd .. " 2>/dev/null")
	local result = handle:read("*a")
	handle:close()
	return result ~= ""
end

local function is_git_cwd()
	local path = vim.loop.cwd() .. "/.git"
	local ok, err = vim.loop.fs_stat(path)
	if not ok then
		return is_git_buffer()
	else
		return true
	end
end

local is_git_repo = nil
local function in_git_repo()
	if is_git_repo == nil then
		is_git_repo = is_git_cwd()
	end
	return is_git_repo
end

return {
	{
		'tpope/vim-fugitive',
		cond = in_git_repo,
		keys = {
			{ "<leader>gs", "<cmd>Git<cr>", desc = "Git" },
		}
	},

	{
		"lewis6991/gitsigns.nvim",
		event = "BufEnter",
		cond = in_git_repo,
		opts = {},
	}
}


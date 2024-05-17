-- When listchars are enable, trailing spaces are highlighted with the Error highlight group
-- Does not highlight in insert mode so that you don’t see it while you’re writing a line

vim.cmd([[match TrailingWhitespace /\s\+$/]])

local group_id = vim.api.nvim_create_augroup("TrailingError", { clear = false })

local function highlight_trailing_error()
	vim.api.nvim_set_hl(0, "TrailingWhitespace", { link = "Error" })
end
local function clear_highlight_trailing()
	vim.api.nvim_set_hl(0, "TrailingWhitespace", { link = "Whitespace" })
end

vim.api.nvim_create_autocmd("OptionSet", {
	pattern = "list",
	callback = function()
		if vim.o.list then
			highlight_trailing_error()
			vim.api.nvim_create_autocmd("InsertEnter", {
				group = group_id,
				callback = clear_highlight_trailing
			})
			vim.api.nvim_create_autocmd("InsertLeave", {
				group = group_id,
				callback = highlight_trailing_error
			})
		else
			clear_highlight_trailing()
			vim.api.nvim_clear_autocmds({ group = group_id })
		end
	end
})


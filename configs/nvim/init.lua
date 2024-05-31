print("hello")

-- load vim config
-- local vimrc = "~/.vimrc"
-- vim.cmd.source(vimrc)

-- fix messages highlight at startup
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		vim.cmd('redraw')
	end
})

local hour = tonumber(os.date("%H"))
if hour >= 6 and hour < 18 then
	vim.opt.background = "light"
else
	vim.opt.background = "dark"
end

require("core")
require("plugins")
require("utils")


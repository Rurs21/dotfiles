-- Util functions module
local M = {}

function M.background_toggle()
	if vim.o.background == "light" then
		vim.opt.background = "dark"
	else
		vim.opt.background = "light"
	end
end

return M


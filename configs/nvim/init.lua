print("Hello!")
local day_of_week = os.date("%A")
local current_date = os.date("%B %d %Y")
local current_time = os.date("%I:%M:%S %p")

local datetime_message = string.format(
	"Today is %s, %s, and the current time is %s.",
	day_of_week, current_date, current_time
)
print(datetime_message)

-- load vim config
vim.cmd.source("~/.config/vim/vimrc")

-- load vim runtime config
local vim_home = vim.fn.expand('~/.vim')
vim.opt.rtp:prepend(vim_home)
vim.opt.rtp:append(vim_home .. '/after')

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

vim.cmd.colorscheme('default')


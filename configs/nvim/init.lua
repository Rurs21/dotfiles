print("Hello!")
local day_of_week = os.date("%A")
local current_date = os.date("%B %d %Y")
local current_time = os.date("%I:%M:%S %p")

local datetime_message = string.format(
	"Today is %s, %s, and the current time is %s.",
	day_of_week, current_date, current_time
)
print(datetime_message)

-- use vim config as the shared baseline
local vim_home = vim.fn.expand("~/.config/vim")
local vim_config = vim_home .. "/vimrc"

-- load vim config
vim.cmd.source(vim.fn.fnameescape(vim_config))
-- load vim runtime config
vim.opt.rtp:prepend(vim_home)
vim.opt.rtp:append(vim_home .. '/after')

-- everything loaded below is Neovim-specific
require("core")
require("plugins")
require("utils")


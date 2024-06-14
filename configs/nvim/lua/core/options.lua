local opt = vim.opt

-- time waited for key sequence
opt.timeoutlen = 1500

-- disable mouse
opt.mouse = ""

-- Line Numbers
opt.number = true
opt.relativenumber = true

-- Tabs & Indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.smartindent = true

-- Keyword for snake_case
opt.iskeyword:remove('_')

-- Line Wrapping
opt.wrap = false

-- Search Settings
opt.hlsearch = false
opt.incsearch = true

-- Cursor Line
opt.cursorline = true

-- Appearance
opt.termguicolors = true
opt.showmode = false
opt.signcolumn = "yes"
opt.guicursor = ""
opt.scrolloff = 10
--opt.colorcolumn = "80"

-- Undo
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

-- Files stuff
opt.isfname:append("@-@")
opt.updatetime = 50
opt.swapfile = false
opt.backup = false


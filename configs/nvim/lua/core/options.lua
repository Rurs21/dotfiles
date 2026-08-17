-- Neovim-specific options belong here
vim.opt.inccommand = "split"

-- Vim and Neovim persistent undo files use incompatible formats
local undo_dir = vim.fn.stdpath("state") .. "/undo"
vim.fn.mkdir(undo_dir, "p", 448)
vim.opt.undodir = undo_dir


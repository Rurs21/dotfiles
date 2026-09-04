-- Neovim-specific options belong here
vim.opt.inccommand = "split"

-- TODO: on Vim 9.2+, consider removing this
-- undo vim/settings/options.vim overrding these with vim's 9.1 config
vim.opt.undodir = vim.fn.stdpath("state") .. "/undo"
vim.opt.shadafile = vim.fn.stdpath("state") .. "/shada/main.shada"


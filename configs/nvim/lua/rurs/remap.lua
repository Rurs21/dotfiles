vim.g.mapleader = " "
vim.opt.timeoutlen = 1500
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- disable arrow keys
vim.keymap.set({"n", "v", "i"}, "<Up>", "<nop>")
vim.keymap.set({"n", "v", "i"}, "<Down>", "<nop>")
vim.keymap.set({"n", "v", "i"}, "<Left>", "<nop>")
vim.keymap.set({"n", "v", "i"}, "<Right>", "<nop>")

-- disable half page navigation
vim.keymap.set({"n", "v", "i"}, "<C-d>", "<nop>")
vim.keymap.set({"n", "v", "i"}, "<C-u>", "<nop>")


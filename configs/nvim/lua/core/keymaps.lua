-- set leaders
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local keymap = vim.keymap
local utils = require('utils.functions')

keymap.set("n", "<Space>", "<Nop>", { silent = true, remap = false })

-- :)
keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- disable arrow keys
keymap.set({"n", "v", "i"}, "<Up>", "<nop>")
keymap.set({"n", "v", "i"}, "<Down>", "<nop>")
keymap.set({"n", "v", "i"}, "<Left>", "<nop>")
keymap.set({"n", "v", "i"}, "<Right>", "<nop>")

-- move select line(s) up or down
keymap.set('n', '<A-j>', ':m .+1<CR>==', { noremap = true, silent = true })
keymap.set('n', '<A-k>', ':m .-2<CR>==', { noremap = true, silent = true })
keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- toggle background (light/dark)
keymap.set("n", "<leader>tt", utils.background_toggle)



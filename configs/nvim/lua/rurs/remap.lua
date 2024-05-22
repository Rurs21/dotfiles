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

-- move select line(s) up or down
vim.api.nvim_set_keymap('n', '<A-j>', ':m .+1<CR>==', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-k>', ':m .-2<CR>==', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<A-j>', ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<A-k>', ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- toggle background (light/dark)
vim.keymap.set({"n", "v", "i"}, "<leader>tt", function()
	if vim.o.background == "light" then
		vim.opt.background = "dark"
	else
		vim.opt.background = "light"
	end
end)


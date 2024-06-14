
-- Set Neovim to listen to the specified socket
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		local socket = '~/.cache/nvim/server.pipe'
		local socket_path = vim.fn.expand(socket)
		vim.fn.serverstart(socket_path)
	end
})


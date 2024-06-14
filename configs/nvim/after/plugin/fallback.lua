--[[
print("hello from fallback")
print(vim.v.errmsg)

-- check errors during the initial config
local function check_for_errors()
	print(vim.v.errmsg)
	if vim.v.errmsg and vim.v.errmsg ~= "" then
		-- Handle the error (for example, log it or show a message)
		vim.cmd('echohl ErrorMsg')
--		vim.cmd('echom "An error occurred during initialization: " .. vim.v.errmsg')
		vim.cmd('echom "An error occurred during initialization"')
		vim.cmd('echohl None')
		-- Clear the error message
		vim.v.errmsg = ""
	end
end

-- Call the function after VimEnter event
vim.api.nvim_create_autocmd('VimEnter', {
	pattern = '*',
	callback = check_for_errors,
})
]]--

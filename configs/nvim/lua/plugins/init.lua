-- install & setup Lazy plugins manager

-- if source by lazy
if package.loaded['lazy'] ~= nil then
	return {}
end

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.cmd('echo "Installing Lazy.nvim" | redraw')
	local clone_cmd = {
		"git", "clone", "--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git","--branch=stable",
		lazypath,
	}
	vim.fn.system(clone_cmd)
	vim.cmd('echo "Installed Lazy.nvim" | redraw')
end
-- prepend plugins data directory to vim runtime path
vim.opt.rtp:prepend(lazypath)

local vim_home = vim.fn.expand('~/.vim')
return require('lazy').setup('plugins', {
	defaults = {
		lazy = true
	},
	install = {
		missing = false,
		colorschme = { "default", "habamax" }
	},
	performance = {
		reset_packpath = true,
		rtp = {
			reset = true,
			paths = { vim_home , vim_home .. '/after' }
		}
	},
	profiling = {
		loader = true
	}
})



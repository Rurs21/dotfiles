local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

return require('lazy').setup({

    'tanvirtin/monokai.nvim',
    {
        "polirritmico/monokai-nightasty.nvim",
        lazy = false,
        priority = 1000,
    },

	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = { 
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			"3rd/image.nvim", -- Optional image support in preview window
		}
	},

	{
		"rebelot/heirline.nvim",
		config = function()
			require("heirline")--.setup({...})
		end
	},

	{
		'nvim-telescope/telescope.nvim', tag = '0.1.5',
		dependencies = { {'nvim-lua/plenary.nvim'} },
		config = function()
			require("telescope").setup({
				pickers = {
					find_files = {
						find_command = { "rg", "--ignore", "-L", "--hidden", "--files" },
						follow = true
					}
				}
			})
		end
	},

	{'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
	'nvim-treesitter/playground',
	'theprimeagen/harpoon',
	'mbbill/undotree',
	'tpope/vim-fugitive',

	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		dependencies = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},
			--- Uncomment these if you want to manage LSP servers from neovim
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-buffer'},
			{'hrsh7th/cmp-path'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'hrsh7th/cmp-nvim-lua'},
			{'saadparwaiz1/cmp_luasnip'},

			-- Snippets
			{'L3MON4D3/LuaSnip'},
			{'rafamadriz/friendly-snippets'}
		}
    },
    
    'tikhomirov/vim-glsl'

})

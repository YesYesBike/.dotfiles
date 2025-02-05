return {
    { --Telescope
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    { --Harpoon
        "ThePrimeagen/harpoon",
		branch = "harpoon2",
        dependencies = { {"nvim-lua/plenary.nvim"} }
    },
    {
        "YesYesBike/vim-yin-yang",
        lazy = false,
        priority = 1000,
    },
	{ --LSP
		"neovim/nvim-lspconfig",
		config = function()
			require('lspconfig').clangd.setup {
				autostart = false
			}
		end,
	},
	{ --LISP
		--TODO disable by default
		"jpalardy/vim-slime",
		init = function()
			if filetype ~= "scheme" then
				return
			end
			vim.g.slime_target = "neovim"
			vim.g.slime_no_mappings = true
		end,
	},
}

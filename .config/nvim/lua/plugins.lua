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
	{ --fork()ed
		"YesYesBike/vim-yin-yang",
		lazy = false,
		priority = 1000,
	},
	{ --LSP
		"neovim/nvim-lspconfig",
		dependencies = { 'saghen/blink.cmp' },
		config = function()
			local capabilities = require('blink.cmp').get_lsp_capabilities()
			require('lspconfig').clangd.setup {
				autostart = false,
				capabilities = capabilities,
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
	{ --Completion
		'saghen/blink.cmp',
		dependencies = {
			'rafamadriz/friendly-snippets',
			'L3MON4D3/LuaSnip',
		},
		version = '*',

		opts = {
			snippets = { preset = 'luasnip' },
			keymap = { preset = 'default' },

			appearance = {
				use_nvim_cmp_as_default = true,
				nerd_font_variant = 'mono'
			},

			sources = {
				default = { 'lsp', 'path', 'snippets', 'buffer' },
			},
		},
		opts_extend = { "sources.default" }
	},
	{
		'L3MON4D3/LuaSnip',
	},
}

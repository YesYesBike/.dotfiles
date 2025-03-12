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
	--{
	--	"dhananjaylatkar/cscope_maps.nvim",
	--	dependencies = {
	--		"nvim-telescope/telescope.nvim",
	--	},
	--	opts = {
	--		-- maps related defaults
	--		disable_maps = false, -- "true" disables default keymaps
	--		skip_input_prompt = false, -- "true" doesn't ask for input
	--		prefix = "<leader>C", -- prefix to trigger maps
	--
	--		-- cscope related defaults
	--		cscope = {
	--			-- location of cscope db file
	--			db_file = "./cscope.out", -- DB or table of DBs
	--			-- NOTE:
	--			--   when table of DBs is provided -
	--			--   first DB is "primary" and others are "secondary"
	--			--   primary DB is used for build and project_rooter
	--			-- cscope executable
	--			exec = "cscope", -- "cscope" or "gtags-cscope"
	--			-- choose your fav picker
	--			picker = "quickfix", -- "quickfix", "telescope", "fzf-lua", "mini-pick" or "snacks"
	--			-- size of quickfix window
	--			qf_window_size = 5, -- any positive integer
	--			-- position of quickfix window
	--			qf_window_pos = "bottom", -- "bottom", "right", "left" or "top"
	--			-- "true" does not open picker for single result, just JUMP
	--			skip_picker_for_single_result = true, -- "false" or "true"
	--			-- custom script can be used for db build
	--			db_build_cmd = { script = "default", args = { "-bqkv" } },
	--			-- statusline indicator, default is cscope executable
	--			statusline_indicator = nil,
	--			-- try to locate db_file in parent dir(s)
	--			project_rooter = {
	--				enable = false, -- "true" or "false"
	--				-- change cwd to where db_file is located
	--				change_cwd = false, -- "true" or "false"
	--			},
	--		},
	--
	--		-- stack view defaults
	--		stack_view = {
	--			tree_hl = true, -- toggle tree highlighting
	--		}
	--	},
	--}
	--{ --LSP
		--	"neovim/nvim-lspconfig",
		--	dependencies = { 'saghen/blink.cmp' },
		--	config = function()
			--		local capabilities = require('blink.cmp').get_lsp_capabilities()
			--		require('lspconfig').clangd.setup {
				--			--autostart = false,
				--			capabilities = capabilities,
				--		}
				--	end,
				--},
				--{ --LISP
					--	--TODO disable by default
					--	"jpalardy/vim-slime",
					--	init = function()
						--		if filetype ~= "scheme" then
						--			return
						--		end
						--		vim.g.slime_target = "neovim"
						--		vim.g.slime_no_mappings = true
						--	end,
						--},
						--{ --Completion
							--	'saghen/blink.cmp',
							--	dependencies = {
								--		'rafamadriz/friendly-snippets',
								--		'L3MON4D3/LuaSnip',
								--	},
								--	version = '*',
								--
								--	opts = {
									--		snippets = { preset = 'luasnip' },
									--		keymap = { preset = 'default' },
									--
									--		appearance = {
										--			use_nvim_cmp_as_default = true,
										--			nerd_font_variant = 'mono'
										--		},
										--
										--		sources = {
											--			default = { 'lsp', 'path', 'snippets', 'buffer' },
											--		},
											--	},
											--	opts_extend = { "sources.default" }
											--},
											--{
												--	'L3MON4D3/LuaSnip',
												--},
											}

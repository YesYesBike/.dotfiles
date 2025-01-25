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
	{ --LISP
		"jpalardy/vim-slime",
		init = function()
			vim.g.slime_target = "neovim"
			vim.g.slime_no_mappings = true
		end,
	},
}

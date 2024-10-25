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
        "pgdouyon/vim-yin-yang",
        lazy = false,
        priority = 1000,
    },
}

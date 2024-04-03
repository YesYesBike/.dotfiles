--When You(but I) Uninstall Plugin... Checkout
--1. yesyesbike/plugins
--2. yesyesbike/remap → <leader>R
--3. yesyesbike/lsp remove comment




--------------------Necessary Plugins----------------------------------------
return
{
    {
        --Telescope
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
        --Treesitter
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function ()
            local configs = require("nvim-treesitter.configs")
            configs.setup({
                ensure_installed = { "c", "lua", "vim", "vimdoc", "bash", "perl", },
                sync_install = false,
                highlight = { enable = true },
                indent = { enable = true },
                auto_install = true,
                ignore_install = {},

            })
        end
    },
    {
        --Harpoon
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { {"nvim-lua/plenary.nvim"} }
    },
    {
        --LSP Stuff
        "neovim/nvim-lspconfig",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        --"jalvesaq/cmp-nvim-r",    --R autocompletion
    },
    {
        --Other Utilities
        --"Aasim-A/scrollEOF.nvim",   --It will be fixed somedays
        --"arnamak/stay-centered.nvim",
    },
    {
        --simple dark colorscheme
        --visit https://github.com/mcchrish/vim-no-color-collections for more
        "hardselius/warlock", --My favorite but only use in a dark place
        "pgdouyon/vim-yin-yang",
        "axvr/photon.vim",
        --"fxn/vim-monochrome",
        --"nikolvs/vim-sunbather",
        --"huyvohcmc/atlas.vim",
        --"ntk148v/komau.vim",
        --"n1ghtmare/noirblaze-vim",
        --"widatama/vim-phoenix",

        lazy = false,
        priority = 1000,
    },
    {
        --vim progaming
        --"ThePrimeagen/vim-be-good",
    },



-------------------Other Things----------------------------------------------
    --[[
    {
        --Nvim-R
        "jalvesaq/Nvim-R",
        lazy=false,
    },
    {
        --Tpope
        "tpope/vim-surround",
    },
    {
        --HTML/CSS/Javascript
        "mattn/emmet-vim",
    },
    {
        --LISP
        "jpalardy/vim-slime",
    }
    --]]
}

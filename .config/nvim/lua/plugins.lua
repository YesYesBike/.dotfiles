return{
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
                ensure_installed = { "c", "lua", "vim", "vimdoc", "bash", "python", "r" },
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
    --[[
    {
        --VimTmuxNavigator
        "christoomey/vim-tmux-navigator",
        cmd = {
            "TmuxNavigateLeft",
            "TmuxNavigateDown",
            "TmuxNavigateUp",
            "TmuxNavigateRight",
            "TmuxNavigatePrevious",
        },
        keys = {
            { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
            { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
            { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
            { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
            { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
        },
    },
    --]]
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
    },
    {
        --Nvim-R
        "jalvesaq/Nvim-R",
        lazy=false,
    },
    {
        --Cmp for R
        "jalvesaq/cmp-nvim-r",
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
        --monochrome colorscheme
        --visit https://github.com/mcchrish/vim-no-color-collections for more
        --"t184256/vim-boring",
        --"jaredgorski/fogbell.vim",
        --"fxn/vim-monochrome",
        --"stefanvanburen/rams.vim",
        --"nikolvs/vim-sunbather",
        --"ryanpcmcquen/true-monochrome_vim",
        "hardselius/warlock",
        --"pgdouyon/vim-yin-yang",
    },
    --[[
    {
        -- Markdown Preview

        -- install without yarn or npm
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    },
    --]]
}

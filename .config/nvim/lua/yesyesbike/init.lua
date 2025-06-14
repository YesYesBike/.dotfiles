require("yesyesbike.set")
require("yesyesbike.remap")
require("yesyesbike.lazy_init")

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 100,
        })
    end,
})

vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

vim.cmd("colorscheme yin")

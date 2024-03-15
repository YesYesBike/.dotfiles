---@diagnostic disable: undefined-global

vim.opt.guicursor = ""
vim.opt.clipboard = unnamedplus
vim.opt.showtabline = 0
vim.opt.ls = 0
vim.opt.ruler = false
vim.opt.shortmess = "atToOFI"
--vim.opt.shortmess = "filnxtToOF"
vim.opt.cmdheight = 0 --setting for the true gigachad
vim.opt.smd = false

vim.opt.nu = false
vim.opt.relativenumber = false

vim.api.nvim_create_autocmd("BufEnter", {
    group = vim.api.nvim_create_augroup('TerminalAutoInsertMode', { clear = true }),
    callback = function()
        if vim.bo.buftype == "terminal" then
            vim.cmd.star()
        end
    end,
})
vim.api.nvim_create_autocmd("TermOpen", {
    group = vim.api.nvim_create_augroup('TerminalSetup', { clear = true }),
    callback = function()
        vim.opt.nu = false
        vim.opt.relativenumber = false
        vim.opt.signcolumn = "no"
        vim.cmd.star()

        --st Default
        --vim.g.terminal_color_0 = "#000000"
        --vim.g.terminal_color_1 = "#cd0000"
        --vim.g.terminal_color_2 = "#00cd00"
        --vim.g.terminal_color_3 = "#cdcd00"
        --vim.g.terminal_color_4 = "#0000ee"
        --vim.g.terminal_color_5 = "#cd00cd"
        --vim.g.terminal_color_6 = "#00cdcd"
        --vim.g.terminal_color_7 = "#e5e5e5"
        --vim.g.terminal_color_8 = "#7f7f7f"
        --vim.g.terminal_color_9 = "#ff0000"
        --vim.g.terminal_color_10 = "#00ff00"
        --vim.g.terminal_color_11 = "#ffff00"
        --vim.g.terminal_color_12 = "#5c5cff"
        --vim.g.terminal_color_13 = "#ff00ff"
        --vim.g.terminal_color_14 = "#00ffff"
        --vim.g.terminal_color_15 = "#ffffff"

        --Tango Dark
        --vim.g.terminal_color_0 = "#2E3436"
        --vim.g.terminal_color_1 = "#CC0000"
        --vim.g.terminal_color_2 = "#4E9A06"
        --vim.g.terminal_color_3 = "#C4A000"
        --vim.g.terminal_color_4 = "#3465A4"
        --vim.g.terminal_color_5 = "#75507B"
        --vim.g.terminal_color_6 = "#06989A"
        --vim.g.terminal_color_7 = "#D3D7CF"
        --vim.g.terminal_color_8 = "#555753"
        --vim.g.terminal_color_9 = "#EF2929"
        --vim.g.terminal_color_10 = "#8AE234"
        --vim.g.terminal_color_11 = "#FCE94F"
        --vim.g.terminal_color_12 = "#729FCF"
        --vim.g.terminal_color_13 = "#AD7FA8"
        --vim.g.terminal_color_14 = "#34E2E2"
        --vim.g.terminal_color_15 = "#EEEEEC"

        --Apprentice
        vim.g.terminal_color_0 = "#1c1c1c"
        vim.g.terminal_color_1 = "#af5f5f"
        vim.g.terminal_color_2 = "#5f875f"
        vim.g.terminal_color_3 = "#87875f"
        vim.g.terminal_color_4 = "#5f87af"
        vim.g.terminal_color_5 = "#5f5f87"
        vim.g.terminal_color_6 = "#5f8787"
        vim.g.terminal_color_7 = "#6C6C6C"
        vim.g.terminal_color_8 = "#444444"
        vim.g.terminal_color_9 = "#ff8700"
        vim.g.terminal_color_10 = "#87af87"
        vim.g.terminal_color_11 = "#ffffaf"
        vim.g.terminal_color_12 = "#87afd7"
        vim.g.terminal_color_13 = "#8787af"
        vim.g.terminal_color_14 = "#5fafaf"
        vim.g.terminal_color_15 = "#ffffff"
    end,
})

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup('HLonYank', { clear = true }),
    callback = function ()
        vim.highlight.on_yank()
    end,
})

vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    group = vim.api.nvim_create_augroup('TwoSpaceTab', { clear = true }),
    pattern = {"*.html", "*.js", "*.php"},
    command = "set softtabstop=2 shiftwidth=2 tabstop=2",
})

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 999
vim.opt.sidescrolloff = 15
vim.opt.signcolumn = "no"
vim.opt.isfname:append("@-@")

vim.opt.splitbelow = true
vim.opt.splitright = true
--vim.opt.fillchars = "vert:''"

vim.opt.updatetime = 50
vim.opt.timeout = false

vim.g.netrw_banner = 0
--vim.g.netrw_winsize = 25


vim.opt.colorcolumn = "80"

vim.cmd.colorscheme('warlock')

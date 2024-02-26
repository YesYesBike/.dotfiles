---@diagnostic disable: undefined-global
vim.opt.guicursor = ""
vim.opt.clipboard = unnamedplus
vim.opt.showtabline = 0
vim.opt.ls = 0
vim.opt.ruler = false

vim.opt.nu = true
vim.opt.relativenumber = true

vim.api.nvim_create_autocmd("TermOpen", {
    callback = function()
        vim.opt.nu = false
        vim.opt.relativenumber = false
        vim.opt.signcolumn = "no"
        --keep terminal colorscheme
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
        --vim.cmd{ cmd = 'highlight', args = { "Terminal guibg='#000000'" } }
        --vim.cmd{ cmd = 'highlight', args = { "Terminal guifg='#e5e5e5'" } }

        --Tango Dark
        vim.g.terminal_color_0 = "#2E3436"
        vim.g.terminal_color_1 = "#CC0000"
        vim.g.terminal_color_2 = "#4E9A06"
        vim.g.terminal_color_3 = "#C4A000"
        vim.g.terminal_color_4 = "#3465A4"
        vim.g.terminal_color_5 = "#75507B"
        vim.g.terminal_color_6 = "#06989A"
        vim.g.terminal_color_7 = "#D3D7CF"
        vim.g.terminal_color_8 = "#555753"
        vim.g.terminal_color_9 = "#EF2929"
        vim.g.terminal_color_10 = "#8AE234"
        vim.g.terminal_color_11 = "#FCE94F"
        vim.g.terminal_color_12 = "#729FCF"
        vim.g.terminal_color_13 = "#AD7FA8"
        vim.g.terminal_color_14 = "#34E2E2"
        vim.g.terminal_color_15 = "#EEEEEC"

        vim.cmd{ cmd = 'highlight', args = { "Terminal guibg='#2E3436'" } }
        vim.cmd{ cmd = 'highlight', args = { "Terminal guifg='#D3D7CF'" } }
    end,
})

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.api.nvim_create_autocmd("BufEnter", {
    callback = function ()
        if vim.bo.filetype == 'html' or vim.bo.filetype == 'php' or vim.bo.filetype == 'js' or vim.bo.filetype == 'css' then
            vim.opt.tabstop = 2
            vim.opt.softtabstop = 2
            vim.opt.shiftwidth = 2
        else
            vim.opt.tabstop = 4
            vim.opt.softtabstop = 4
            vim.opt.shiftwidth = 4
        end
    end,
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

vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 12
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.splitbelow = true
vim.opt.splitright = true
--vim.opt.fillchars = "vert:''"

vim.opt.updatetime = 50
vim.opt.timeout = false

vim.opt.colorcolumn = "80"

vim.cmd.colorscheme('warlock')


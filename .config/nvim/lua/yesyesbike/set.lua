---@diagnostic disable: undefined-global
vim.opt.guicursor = ""
vim.opt.clipboard = unnamedplus
vim.opt.showtabline = 0
vim.opt.ls = 0
vim.opt.ruler = false

vim.opt.nu = false
vim.opt.relativenumber = false

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

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
vim.opt.signcolumn = "no"
vim.opt.isfname:append("@-@")

vim.opt.splitbelow = true
vim.opt.splitright = true
--vim.opt.fillchars = "vert:''"

vim.opt.updatetime = 50
vim.opt.timeout = false

vim.opt.colorcolumn = "80"

vim.cmd.colorscheme('slate')



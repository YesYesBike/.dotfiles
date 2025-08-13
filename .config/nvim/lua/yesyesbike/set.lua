vim.opt.guicursor = ""

vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.showmode = false
vim.opt.shortmess = "atToOFI"
-- vim.opt.cpoptions = "BceFs_"

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.infercase = false

vim.opt.termguicolors = true

vim.opt.scrolloff = 999
vim.opt.isfname:append("@-@")

vim.opt.laststatus = 0

vim.opt.updatetime = 50
vim.opt.timeout = false

vim.opt.colorcolumn = "80"
vim.opt.cursorline = true

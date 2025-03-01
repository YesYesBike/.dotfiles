--vim.g.filetype_pl = "prolog"	--perlog
vim.opt.guicursor = ""
vim.opt.mouse = ""
vim.opt.clipboard = unnamedplus
vim.opt.showtabline = 0
vim.opt.ls = 0
vim.opt.ruler = false		--false
vim.opt.shortmess = "atToOFI"	--"filnxtToOF"
vim.opt.cpoptions = "BceFs_"
vim.opt.cmdheight = 1		--0
vim.opt.smd = false			--false
vim.opt.showcmd = true
vim.opt.showcmdloc = "last"
vim.opt.cursorline = true

vim.opt.nu = false
vim.opt.relativenumber = false

vim.opt.cinoptions = ":0s"

vim.api.nvim_create_autocmd("TermOpen", {
	group = vim.api.nvim_create_augroup('TerminalSetup', { clear = true }),
	callback = function()
		vim.opt.nu = false
		vim.opt.relativenumber = false
		vim.opt.signcolumn = "no"
		vim.cmd.star()
	end,
})

vim.api.nvim_create_autocmd("BufEnter", {
	group = vim.api.nvim_create_augroup('TerminalStar', { clear = true }),
	callback = function()
		if vim.bo.buftype == "terminal" then
			vim.cmd.star()
		end
	end,
})

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false
vim.opt.smartindent = true

vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
	group = vim.api.nvim_create_augroup('LessmodeHelp', { clear = true }),
	callback = function ()
		if vim.bo.buftype == "help" then
			vim.opt.colorcolumn = ""
			vim.keymap.set("n", "q", ":q<cr>", {buffer = true})
			--vim.keymap.set("n", "d", "<C-d>", {buffer = true})
			--vim.keymap.set("n", "u", "<C-u>", {buffer = true})
			--vim.keymap.set("n", "<C-g>", "<C-g>", {buffer = true})
			--vim.keymap.set({"n","x"}, "y", '"+y', {buffer = true, noremap = true})
		elseif vim.bo.buftype == "quickfix" then
			vim.keymap.set("n", "q", ":q<cr>", {buffer = true})
		end
	end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup('HLonYank', { clear = true }),
	callback = function ()
		vim.highlight.on_yank()
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
vim.opt.infercase = false

vim.opt.termguicolors = true

vim.opt.scrolloff = 999
vim.opt.sidescrolloff = 7
vim.opt.signcolumn = "number"
vim.opt.isfname:append("@-@")

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.updatetime = 1000
vim.opt.timeout = false

vim.g.netrw_banner = 0
--vim.g.netrw_winsize = 25


vim.opt.colorcolumn = "80"

vim.cmd.colorscheme('yin')

--Trailing Whitespace
vim.cmd.highlight("ExtraWhitespace ctermbg=DarkMagenta guibg=#440044")
vim.cmd.match("ExtraWhitespace /\\s\\+$/")
vim.api.nvim_create_autocmd("InsertLeave", {
	group = vim.api.nvim_create_augroup('ExtraWhiteOn', { clear = true }),
	command = "hi ExtraWhitespace ctermbg=DarkMagenta guibg=#440044"
})
vim.api.nvim_create_autocmd("InsertEnter", {
	group = vim.api.nvim_create_augroup('ExtraWhiteOff', { clear = true }),
	command = "hi clear ExtraWhitespace"
})

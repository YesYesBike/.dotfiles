vim.g.filetype_pl = "prolog"	--perlog
vim.opt.guicursor = ""
vim.opt.clipboard = unnamedplus
vim.opt.showtabline = 0
vim.opt.ls = 0
vim.opt.ruler = false		--false
vim.opt.shortmess = "atToOFI"	--"filnxtToOF"
--vim.opt.cpoptions = "aABceFs_"
vim.opt.cmdheight = 1		--0
vim.opt.smd = false			--false
vim.opt.showcmd = true
vim.opt.showcmdloc = "last"

vim.opt.nu = true
vim.opt.relativenumber = false

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
			vim.keymap.set("n", "d", "<C-d>", {buffer = true})
			vim.keymap.set("n", "u", "<C-u>", {buffer = true})
			vim.keymap.set("n", "<C-g>", "<C-g>", {buffer = true})
		end
	end,
})

--vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
--	group = vim.api.nvim_create_augroup('LessmodeMan', { clear = true }),
--	pattern = {"man://*"},
--	callback = function ()
--		vim.opt.colorcolumn = ""
--		vim.keymap.set("n", "q", ":q<cr>", {buffer = true})
--		vim.keymap.set("n", "d", "<C-d>", {buffer = true})
--		vim.keymap.set("n", "u", "<C-u>", {buffer = true})
--		vim.keymap.set("n", "<C-g>", "<C-g>", {buffer = true})
--	end,
--})

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
vim.opt.sidescrolloff = 15
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

vim.keymap.set("n", "<leader>E", ":Ex<cr>")

--Skill Issue
vim.keymap.set({"n", "x"}, "H", "^")
vim.keymap.set({"n", "x"}, "L", "$")

--clear buffer list
vim.keymap.set("n", "<leader>c", "mz:%bd|e#|bd#<cr>`z")

vim.keymap.set("x", "J", ":m '>+1<CR>gv=gv", { desc = "Move one line down the selection" })
vim.keymap.set("x", "K", ":m '<-2<CR>gv=gv", { desc = "Move one line up the selection" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "J without moving cursor" })
vim.keymap.set("n", "gJ", "mzgJ`z", { desc = "gJ without moving cursor" })

vim.keymap.set("x", "<leader>p", "\"_dP",
{ desc = "Paste to selection and keep current register" })

vim.keymap.set("n", "<leader>y", "\"+y", { desc = "yank to clipboard" })
vim.keymap.set("x", "<leader>y", "\"+y", { desc = "yank to clipboard" })
vim.keymap.set("n", "<leader>Y", "\"+y$", { desc = "yank to clipboard" })

vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "save with less keystrokes" })
vim.keymap.set("n", "<leader>q", "<cmd>q<CR>", { desc = "quit with less keystrokes" })
vim.keymap.set("n", "<leader>x", "<cmd>!chmod u+x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>",
{ desc = "substitute the word under the cursor in a whole file" })

--Reload Setting and Keymap
vim.keymap.set("n", "<leader>R", function()
	vim.cmd("au!")

	local cmdir = 'luafile '..os.getenv('HOME')..'/.config/nvim/lua/yesyesbike/'
	local load = {'init', 'set', 'remap', 'plugin', 'telescope', 'harpoon'}
	for i,v in ipairs(load) do
		local string = cmdir..v..'.lua'
		vim.cmd(string)
	end
end, { desc = "Reload setting" })

--Switching Panes
vim.keymap.set("n", "<C-j>", "<ESC><C-w>j")
vim.keymap.set("n", "<C-k>", "<ESC><C-w>k")

--Terminal
vim.keymap.set("t", "<ESC><ESC>", "<C-\\><C-n>")
vim.keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k")
vim.keymap.set("n", "<leader>t", "<cmd>10new<CR>:te<CR>")


local function makefile_check()
	local file = io.open('Makefile', "r")
	if file then
		io.close(file)
		return true
	else
		return false
	end
end

local function runsh_check()
	local file = io.open('run.sh', "r")
	if file then
		io.close(file)
		return true
	else
		return false
	end
end


--Build
vim.keymap.set("n", "<leader>m", function ()
	if makefile_check() then
		vim.cmd('make!')
	elseif vim.bo.filetype == "c" then
		vim.cmd('!gcc %')
	else
		vim.cmd('!./build.sh')
	end
end)


--Run the current file in terminal
vim.keymap.set("n", "<leader>rr", function()
	local filetype = vim.bo.filetype
	if makefile_check() then
		vim.cmd("10new")
		vim.cmd.te("make tmux-run")
	elseif runsh_check() then
		vim.cmd("10new")
		vim.cmd.te("./run.sh")
	elseif filetype == "c" then
		vim.cmd("10new")
		vim.cmd.te("gcc # && ./a.out")
	else
		vim.cmd("10new")
		vim.cmd.te("./#")
	end
end)


--Run the debugger in new tmux window
vim.keymap.set("n", "<leader>rd", function()
	local filetype = vim.bo.filetype
	if makefile_check() then
		vim.cmd('silent make! tmux-dbg')
	elseif vim.bo.filetype == "c" then
		vim.cmd("!gcc -g % && tmux neww -c %:p:h 'gdb a.out'")
	else
		vim.cmd("silent !./debug.sh")
	end
end)

vim.keymap.set("n", "<leader>1", function ()
	vim.bo.filetype = 'bash'
	vim.cmd.norm('a#!/usr/bin/sh')
	vim.cmd.norm('2o')
	vim.cmd.write({mods = {silent = true}})
	vim.cmd('silent !chmod u+x %')
	vim.cmd.star()
end)
vim.keymap.set("n", "<leader>2", function ()
	vim.cmd("0read ~/.dotfiles/boiler/perl")
	vim.bo.filetype = 'perl'
	vim.cmd.write({mods = {silent = true}})
	vim.cmd('silent !chmod u+x %')
	vim.cmd("$")
	vim.cmd.star()
end)

--Formattttt
vim.keymap.set({"x","n"}, "<leader>f", "mzgg=G`z")

--Quickfix
vim.keymap.set("n", "<leader>v", "<cmd>copen<cr>")

--han
--what a emax
vim.keymap.set("i", "<C-c><C-f>", "<esc><cmd>.!han -e$'\\014'<cr>A")
vim.keymap.set("i", "<C-c><C-c>", "<esc><cmd>.!han -E$'\\014'<cr>A")
vim.keymap.set("i", "<C-c><C-g>", "<esc><cmd>.!han -o$'\\014'<cr>A")
vim.keymap.set("i", "<C-c><C-v>", "<esc><cmd>.!han -O$'\\014'<cr>A")
vim.keymap.set("i", "<C-l>", "<Right>")
vim.keymap.set("i", "<C-c><C-l>", "<C-l><C-l><esc>i")

--ctags
vim.keymap.set("n", "<F5>", "<cmd>!ctags -R<cr>")

--shortcut from windows
vim.keymap.set("i", "<C-s>", "<esc><cmd>w<cr>a")

--vim.keymap.set("n", "<leader>K", function()
--	vim.opt.tabstop = 8
--	vim.opt.softtabstop = 8
--	vim.opt.shiftwidth = 8
--end)

--Colorscheme for bright place
vim.keymap.set("n", "<leader>C", function ()
	if vim.o.background == 'dark' then
		vim.o.background = 'light'
	else
		vim.o.background = 'dark'
	end
end)

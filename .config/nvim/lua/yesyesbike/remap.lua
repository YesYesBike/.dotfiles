vim.keymap.set("n", "<leader>E", vim.cmd.Ex)

vim.keymap.set({"n", "x"}, "<leader>h", function ()
	if vim.o.number == false then
		vim.o.number = true
		vim.o.relativenumber = true
		vim.o.signcolumn = "number"
		print("set number")
	elseif vim.o.number == true then
		vim.o.number = false
		vim.o.relativenumber = false
		vim.o.signcolumn = "no"
		print("set nonumber")
	end
end)


vim.keymap.set({"n", "x"}, "<leader>H", function ()
	if vim.o.hlsearch == false then
		vim.o.hlsearch = true
	elseif vim.o.hlsearch == true then
		vim.o.hlsearch = false
	end
end)


vim.keymap.set("n", "<C-g>", function ()
	if vim.o.ls == 0 then
		--vim.o.cmdheight = 1
		vim.o.ls = 2
		vim.o.ruler = true
	elseif vim.o.ls == 2 then
		--vim.o.cmdheight = 0
		vim.o.ls = 0
		vim.o.ruler = false
	end
end)


--usless keys...
vim.keymap.set({"n","x","i"}, "<Home>", "<nop>")
vim.keymap.set({"n","x","i"}, "<PageUp>", "<nop>")
vim.keymap.set({"n","x","i"}, "<PageDown>", "<nop>")
vim.keymap.set({"n","x","i"}, "<END>", "<nop>")


--Skill Issue
vim.keymap.set({"n", "x"}, "H", "^")
vim.keymap.set({"n", "x"}, "L", "$")


--clear buffer list
vim.keymap.set("n", "<leader>c", "mz:%bd|e#<cr>`z")

vim.keymap.set("x", "J", ":m '>+1<CR>gv=gv", { desc = "Move one line down the selection" })
vim.keymap.set("x", "K", ":m '<-2<CR>gv=gv", { desc = "Move one line up the selection" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "J without moving cursor" })
vim.keymap.set("n", "gJ", "mzgJ`z", { desc = "gJ without moving cursor" })

vim.keymap.set("x", "<leader>p", "\"_dP",
	{ desc = "Paste to selection and keep current register" })

vim.keymap.set("n", "<leader>y", "\"+y", { desc = "yank to clipboard" })
vim.keymap.set("x", "<leader>y", "\"+y", { desc = "yank to clipboard" })
vim.keymap.set("n", "<leader>Y", "\"+y$", { desc = "yank to clipboard" })

vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "save with less keystrokes" })
vim.keymap.set("n", "<leader>q", ":q<CR>", { desc = "quit with less keystrokes" })
vim.keymap.set("n", "<leader>x", ":!chmod u+x %<CR>", { silent = true })

--Anyone knows how to quit Ex?
vim.keymap.set("n", "Q", "gQ")

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
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")

--Resize Panes
vim.keymap.set({"n", "t"}, "<C-Left>", ":vertical resize -1<CR>")
vim.keymap.set({"n", "t"}, "<C-Right>", ":vertical resize +1<CR>")
vim.keymap.set({"n", "t"}, "<C-Up>", ":resize +1<CR>")
vim.keymap.set({"n", "t"}, "<C-Down>", ":resize -1<CR>")

--FULLSCREEN
vim.keymap.set("n", "<C-w><Space>", "<C-w>_<C-w>|")


--Terminal
vim.keymap.set("t", "<ESC><ESC>", "<C-\\><C-n>")
vim.keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h")
vim.keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k")
vim.keymap.set("t", "<C-j>", "<C-\\><C-n><C-w>j")
vim.keymap.set("n", "<leader>T", ":11new<CR>:te<CR>")
vim.keymap.set("n", "<leader>vT", ":47vnew<CR>:te<CR>")


--Run the current file in terminal
--Note: use #

local function check_makefile()
	local file = io.open('Makefile', "r")
	if file then
		io.close(file)
		return true
	else
		return false
	end
end

vim.keymap.set("n", "<leader>rr", function()
	local filetype = vim.bo.filetype
	if filetype == "c" or filetype == "make" then
		if check_makefile() then
			vim.cmd('make!')
			vim.cmd("!~/util/make_target")
			vim.cmd("11new")
			vim.cmd.te("filename=$(< /tmp/__FILENAME42069);./$filename;exit")
		else
			vim.cmd("11new")
			vim.cmd.te("~/util/gcc #;exit")
		end
	--elseif filetype == "asm" then
	--	vim.cmd("!echo % > /tmp/__FILENAME42069")
	--	vim.cmd("11new")
	--	vim.cmd.te("~/util/asm")
	--elseif filetype == "rodrego" then
	--	vim.cmd("!echo % > /tmp/__FILENAME42069")
	--	vim.cmd("11new")
	--	vim.cmd.te("filename=$(< /tmp/__FILENAME42069);~/projects/rodrego/rodrego $filename;exit")
	--elseif filetype == "rodrego_ex" then
	--	vim.cmd('make!')
	--	vim.cmd("!echo % > /tmp/__FILENAME42069")
	--	vim.cmd("11new")
	--	vim.cmd.te("filename=$(< /tmp/__FILENAME42069);~/projects/rgx/rgx $filename;exit")
	elseif filetype == "fortran" then
			vim.cmd("11new")
			vim.cmd.te("~/util/gcc # -F ;exit")
	--elseif filetype == "lua" then
	--	  vim.cmd.so()
	--elseif filetype == "racket" then
	--	  vim.cmd("!echo % > /tmp/__FILENAME42069")
	--	  vim.cmd("50vnew")
	--	  vim.cmd.te("filename=$(< /tmp/__FILENAME42069);racket")
	else
		vim.cmd("11new")
		vim.cmd.te("./#")
	end
end)


vim.keymap.set("n", "<leader>m", function ()
	if check_makefile() then
		vim.cmd('make!')
	elseif vim.bo.filetype == "c" then
		vim.cmd('!gcc %')
	elseif vim.bo.filetype == "fortran" then
		vim.cmd('!gfortran %')
	elseif vim.bo.filetype == "asm" then
		vim.cmd('!as %; ld a.out -o build')
	end
end)


--Run the debugger in new tmux window
vim.keymap.set("n", "<leader>rd", function()
	local filetype = vim.bo.filetype
	if filetype == "c" or filetype == "make" then
		if check_makefile() then
			vim.cmd('make!')
			vim.cmd("!~/util/make_target")
			vim.cmd("silent !pwd > /tmp/__PWD42069")
			vim.cmd("silent !~/util/tmux-gdb-make")
		else
			vim.cmd("silent !echo % > /tmp/__FILENAME42069")
			vim.cmd("silent !pwd > /tmp/__PWD42069")
			vim.cmd("silent !~/util/tmux-gdb")
		end
	end
end)

--Setting filetype
vim.keymap.set("n", "<leader>1", function ()
	vim.bo.filetype = 'bash'
	vim.cmd.norm('a#!/usr/bin/sh')
	vim.cmd.norm('2o')
	vim.cmd.write({mods = {silent = true}})
	vim.cmd('silent !chmod u+x %')
	vim.cmd.star()
end)
vim.keymap.set("n", "<leader>2", function ()
	vim.bo.filetype = 'perl'
	vim.cmd.norm('a#!/usr/bin/perl')
	--vim.cmd.norm('a')
	vim.cmd.write({mods = {silent = true}})
	vim.cmd('silent !chmod u+x %')
	--vim.cmd.star()
end)
vim.keymap.set("n", "<leader>3", function ()
	vim.bo.filetype = 'python'
	vim.cmd.norm('a#!/usr/bin/python')
	vim.cmd.norm('2o')
	vim.cmd.write({mods = {silent = true}})
	vim.cmd('silent !chmod u+x %')
	vim.cmd.star()
end)


--Formattttt
vim.keymap.set({"x","n"}, "<leader>f", function()
	if vim.bo.filetype == 'c' then
		vim.cmd.perldo("s/\\b(if|for|while|switch)\\(/$1 (/g; s/(\\)|else|do)\\{/$1 {/g;")
	end
end)

--Colorscheme for bright place
vim.keymap.set("n", "<leader>j", function ()
	if vim.o.background == 'dark' then
		vim.o.background = 'light'
	else
		vim.o.background = 'dark'
	end
end)



--Clear cmdline
vim.keymap.set("n", "<leader><leader>", ":echo '' | redraw<cr>")

--UTF_*
vim.keymap.set("n", "<leader>U", ":set fileencoding=utf-8<cr>")


--Kernel Coding Style...
vim.keymap.set("n", "<leader>K", function ()
	if vim.g.kernelcodingstyle == 0 then
		vim.g.kernelcodingstyle = 1
		vim.opt.tabstop = 8
		vim.opt.softtabstop = 8
		vim.opt.shiftwidth = 8
		vim.opt.smartindent = false
	else
		vim.g.kernelcodingstyle = 0
		vim.opt.tabstop = 4
		vim.opt.softtabstop = 4
		vim.opt.shiftwidth = 4
		vim.opt.smartindent = true
	end
end)


--unexpand tabbsss
vim.keymap.set("n", "<leader>tt", "mz:%!unexpand -t4<cr>`z")
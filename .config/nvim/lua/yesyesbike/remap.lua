vim.keymap.set("n", "<leader>E", vim.cmd.Ex)

vim.keymap.set({"n", "x"}, "<leader>h", function ()
	if vim.o.number == false then
		vim.o.number = true
		--vim.o.relativenumber = true
		vim.o.signcolumn = "number"
		print("set number")
	elseif vim.o.number == true then
		vim.o.number = false
		--vim.o.relativenumber = false
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

vim.keymap.set("n", "Q", "gQ")

vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>",
{ desc = "substitute the word under the cursor in a whole file" })

--Reload Setting and Keymap
vim.keymap.set("n", "<leader>R", function()
	vim.cmd("au!")

	local cmdir = 'luafile '..os.getenv('HOME')..'/.config/nvim/lua/yesyesbike/'
	local load = {'init', 'set', 'remap', 'plugin', 'telescope', 'harpoon', 'slime', 'lsp'}
	for i,v in ipairs(load) do
		local string = cmdir..v..'.lua'
		vim.cmd(string)
	end
end, { desc = "Reload setting" })

--Switching Panes
vim.keymap.set("n", "<C-j>", "<ESC><C-w>j")
vim.keymap.set("n", "<C-k>", "<ESC><C-w>k")

--Resize Panes
--vim.keymap.set({"n", "t"}, "<C-Left>", ":vertical resize -1<CR>")
--vim.keymap.set({"n", "t"}, "<C-Right>", ":vertical resize +1<CR>")
vim.keymap.set({"n", "t"}, "<C-Up>", ":resize +1<CR>")
vim.keymap.set({"n", "t"}, "<C-Down>", ":resize -1<CR>")

--FULLSCREEN
--vim.keymap.set("n", "<C-w><Space>", "<C-w>_<C-w>|")


--Terminal
vim.keymap.set("t", "<ESC><ESC>", "<C-\\><C-n>")
vim.keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k")
vim.keymap.set("n", "<leader>t", "<cmd>11new<CR>:te<CR>")


local function makefile_check()
	local file = io.open('Makefile', "r")
	if file then
		io.close(file)
		return true
	else
		return false
	end
end

local function makefile_target()
	local f = io.popen('~/util/vim_make ' .. os.getenv('PWD'), 'r')
	local ret = f:read('*a')
	f:close()

	return ret
end


--Build
vim.keymap.set("n", "<leader>m", function ()
	if makefile_check() then
		vim.cmd('make!')
	elseif vim.bo.filetype == "c" then
		vim.cmd('!gcc %')
	elseif filetype == "sml" then
		vim.cmd("!mlton %")
	end
end)


--Run the current file in terminal
vim.keymap.set("n", "<leader>rr", function()
	local filetype = vim.bo.filetype
	if makefile_check() then
		vim.cmd('make!')
		--TODO: condition check
		local target = makefile_target()
		vim.cmd("11new")
		vim.cmd.te("./" .. target)
	elseif filetype == "c" then
		vim.cmd("11new")
		vim.cmd.te("gcc # && ./a.out")
	elseif filetype == "sml" then
		vim.cmd("11new")
		vim.cmd.te("mlton # && ./#<")
	else
		vim.cmd("11new")
		vim.cmd.te("./#")
	end
end)


--Run the debugger in new tmux window
vim.keymap.set("n", "<leader>rd", function()
	local filetype = vim.bo.filetype
	if makefile_check() then
		vim.cmd('silent make!')
		--TODO: condition check
		local target = makefile_target()
		os.execute("tmux neww -c " .. os.getenv('PWD') .. " gdb " .. target)
	elseif vim.bo.filetype == "c" then
		vim.cmd("!gcc -g % && tmux neww -c %:p:h 'gdb a.out'")
	--elseif filetype == "lua" then
	--	--not debug mode but interactive mode
	--	vim.cmd("11new")
	--	vim.cmd.te("lua -i #")
	elseif filetype == "scheme" then
		vim.cmd("11new")
		vim.cmd.te("guile -l #")
	elseif filetype == "sml" then
		vim.cmd("11new")
		vim.cmd.te("smlnj #")
	end
end)

--Run LUAAAAAA
vim.keymap.set("n", "<leader>rl", function()
	vim.cmd("11new")
	vim.cmd.te("lua")
end)

--Run PYTHONNNNN
vim.keymap.set("n", "<leader>rp", function()
	vim.cmd("11new")
	vim.cmd.te("python")
end)

--Run GUILLLLLLE
vim.keymap.set("n", "<leader>rg", function()
	vim.cmd("11new")
	vim.cmd.te("guile")
end)

--Setting filetype
--TODOTODOTODO
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
vim.keymap.set("n", "<leader>3", function ()
	vim.bo.filetype = 'python'
	vim.cmd.norm('a#!/usr/bin/python')
	vim.cmd.norm('2o')
	vim.cmd.write({mods = {silent = true}})
	vim.cmd('silent !chmod u+x %')
	vim.cmd.star()
end)
vim.keymap.set("n", "<leader>4", function ()
	vim.bo.filetype = 'lua'
	vim.cmd.norm('a#!/usr/bin/lua')
	vim.cmd.norm('2o')
	vim.cmd.write({mods = {silent = true}})
	vim.cmd('silent !chmod u+x %')
	vim.cmd.star()
end)
vim.keymap.set("n", "<leader>5", function ()
	vim.cmd("0read ~/.dotfiles/boiler/scheme")
	vim.bo.filetype = 'scheme'
	vim.cmd.write({mods = {silent = true}})
	vim.cmd('silent !chmod u+x %')
	vim.cmd("$")
	vim.cmd.star()
end)


--Formattttt
vim.keymap.set({"x","n"}, "<leader>f", "mzgg=G`z")

--Colorscheme for bright place
vim.keymap.set("n", "<leader>C", function ()
	if vim.o.background == 'dark' then
		vim.o.background = 'light'
	else
		vim.o.background = 'dark'
	end
end)



--Quickfix
vim.keymap.set("n", "<leader>v", "<cmd>copen<cr>")
vim.keymap.set("n", "<leader>,", "<cmd>cprev<cr>")
vim.keymap.set("n", "<leader>.", "<cmd>cnext<cr>")

--Kernel Coding Style...
vim.keymap.set("n", "<leader>K", function ()
	if vim.g.kernelcodingstyle == 1 then
		vim.g.kernelcodingstyle = 0
		vim.opt.tabstop = 4
		vim.opt.softtabstop = 4
		vim.opt.shiftwidth = 4
		vim.opt.smartindent = true
	else
		vim.g.kernelcodingstyle = 1
		vim.opt.tabstop = 8
		vim.opt.softtabstop = 8
		vim.opt.shiftwidth = 8
		vim.opt.smartindent = false
	end
end)


--han
--what a emax
vim.keymap.set("i", "<C-c><C-f>", "<esc><cmd>.!han -e$'\\014'<cr>A")
vim.keymap.set("i", "<C-c><C-c>", "<esc><cmd>.!han -E$'\\014'<cr>A")
vim.keymap.set("i", "<C-c><C-g>", "<esc><cmd>.!han -o$'\\014'<cr>A")
vim.keymap.set("i", "<C-c><C-v>", "<esc><cmd>.!han -O$'\\014'<cr>A")

--shortcut from windows
vim.keymap.set("i", "<C-s>", "<esc><cmd>w<cr>a")

--right
vim.keymap.set("i", "<C-l>", "<Right>")
vim.keymap.set("i", "<C-c><C-l>", "<C-l><C-l><esc>i")

--ctags
vim.keymap.set("n", "<F5>", "<cmd>!ctags -R<cr>")

--lsp
vim.keymap.set("n", "<leader>L", function()
	vim.cmd("LspStart")
	print("lsp")
end)

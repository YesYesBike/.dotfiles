vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.w.nutoggle = 1
vim.w.hltoggle = 0

vim.keymap.set({"n", "v"}, "<leader>h", function ()
    if vim.w.nutoggle == 0 then
        vim.w.nutoggle = 1
        vim.opt.number = true
        vim.opt.relativenumber = true
        vim.opt.signcolumn = "yes"
        print("set number")
    elseif vim.w.nutoggle == 1 then
        vim.w.nutoggle = 0
        vim.opt.number = false
        vim.opt.relativenumber = false
        vim.opt.signcolumn = "no"
        print("set nonumber")
    end
end)


vim.keymap.set("n", "<leader>H", function ()
    if vim.w.hltoggle == 0 then
        vim.w.hltoggle = 1
        vim.opt.hlsearch = true
        print("set hlsearch")
    elseif vim.w.hltoggle == 1 then
        vim.w.hltoggle = 0
        vim.opt.hlsearch = false
        print("set nohlsearch")
    end
end)

--Placing cursor center
vim.keymap.set({ "n", "v" }, "*", "*zz")
vim.keymap.set({ "n", "v" }, "#", "#zz")
vim.keymap.set({ "n", "v" }, "<C-d>", "<C-d>zz")
vim.keymap.set({ "n", "v" }, "<C-u>", "<C-u>zz")
vim.keymap.set({ "n", "v" }, "n", "nzzzv")
vim.keymap.set({ "n", "v" }, "N", "Nzzzv")


vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "gJ", "mzgJ`z")

vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set({"n", "v"}, "<leader>c", "\"_c")
vim.keymap.set({"n", "v"}, "<leader>d", "\"_d")
vim.keymap.set({"n", "v"}, "<leader>x", "\"_x")

vim.keymap.set("n", "Q", "<nop>")

--vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

--statusbar toggle
local statustoggle = 0
vim.keymap.set("n", "<leader>S", function()
    if statustoggle == 0 then
        statustoggle = 1
        vim.opt.ls = 2
        vim.opt.ruler = true
        --vim.opt.cmdheight = 1
        print("Status Bar On")
    elseif statustoggle == 1 then
        statustoggle = 0
        vim.opt.ls = 0
        vim.opt.ruler = false
        --vim.opt.cmdheight = 0
        print("Status Bar Off")
    end

end)

--Reload Setting and Keymap
vim.keymap.set("n", "<leader>R", function()
    vim.cmd("au!")
    vim.cmd('luafile $HOME/.config/nvim/lua/yesyesbike/init.lua')
    vim.cmd('luafile $HOME/.config/nvim/lua/yesyesbike/set.lua')
    vim.cmd('luafile $HOME/.config/nvim/lua/yesyesbike/remap.lua')
    vim.cmd('luafile $HOME/.config/nvim/lua/yesyesbike/plugin.lua')
    vim.cmd('luafile $HOME/.config/nvim/lua/yesyesbike/telescope.lua')
    vim.cmd('luafile $HOME/.config/nvim/lua/yesyesbike/harpoon.lua')
    vim.cmd('luafile $HOME/.config/nvim/lua/yesyesbike/lsp.lua')
    vim.cmd('luafile $HOME/.config/nvim/lua/yesyesbike/luasnip.lua')
    --vim.cmd('luafile $HOME/.config/nvim/lua/yesyesbike/vim-slime.lua')
    --vim.cmd('luafile $HOME/.config/nvim/lua/yesyesbike/nvimr.lua')
    --vim.cmd('luafile $HOME/.config/nvim/lua/yesyesbike/emmet.lua')

    --[[
    local handle = io.popen("ls ~/.config/nvim/lua/yesyesbike/ | grep lua")
    local result = handle:read("*a")
    handle:close()
    --for fileCount = 1, #result do
    print(result)
    --]]

end)

--Switching Panes
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")

--Resize Panes
vim.keymap.set({"n", "t"}, "<C-Left>", "<cmd>vertical resize -1<CR>")
vim.keymap.set({"n", "t"}, "<C-Right>", "<cmd>vertical resize +1<CR>")
vim.keymap.set({"n", "t"}, "<C-Up>", "<cmd>resize +1<CR>")
vim.keymap.set({"n", "t"}, "<C-Down>", "<cmd>resize -1<CR>")

--FULLSCREEN
vim.keymap.set("n", "<C-w><Space>", "<C-w>_<C-w>|")


--Terminal
vim.keymap.set("t", "<ESC><ESC>", "<C-\\><C-n>")
vim.keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h")
vim.keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k")
vim.keymap.set("n", "<leader>T", "<cmd>11new<CR><cmd>te<CR><cmd>file Terminal<CR>")
vim.keymap.set("n", "<leader>vT", "<cmd>57vnew<CR><cmd>te<CR><cmd>file vTerminal<CR>")


--Run the current buffer in terminal
vim.keymap.set("n", "<leader>rr", function()
    local filetype = vim.bo.filetype
    if filetype == "c" then
        vim.cmd("!echo % > __FILENAME")
        vim.cmd("11new")
        vim.cmd.te("filename=$(cat __FILENAME);~/bash/./gcc.sh $filename;rm __FILENAME;exit")
    elseif filetype == "racket" then
        vim.cmd("!echo % > __FILENAME")
        vim.cmd("70vnew")
        vim.cmd.te("filename=$(cat __FILENAME);racket")
    else
        vim.cmd("!echo % > __FILENAME")
        vim.cmd("11new")
        vim.cmd.te("filename=$(cat __FILENAME);./$filename;rm __FILENAME;exit")
    end
end)


--Run the debugger in terminal
vim.keymap.set("n", "<leader>rd", function()
    local filetype = vim.bo.filetype
    if filetype == "c" then
        vim.cmd("!echo % > __FILENAME")
        vim.cmd("160vnew")
        vim.cmd.te("filename=$(cat __FILENAME);~/bash/./gcc.sh $filename g;rm __FILENAME;exit")
    end
end)

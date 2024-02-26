vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.w.nutoggle = 1
vim.w.man_mode = 0

vim.keymap.set({"n", "v"}, "<leader>h", function ()
    if vim.w.man_mode == 0 then
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
    else
        print("cant set number")
    end
end)

--some experiment
vim.keymap.set("n", "j", "jzz")
vim.keymap.set("n", "k", "kzz")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "gJ", "mzgJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "p", "\"_dP", { noremap = true })
vim.keymap.set("x", "<leader>p", "P")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "d", "\"_d", { noremap = true })
vim.keymap.set("v", "d", "\"_d", { noremap = true })
vim.keymap.set("n", "<leader>d", "d")
vim.keymap.set("v", "<leader>d", "d")

vim.keymap.set("n", "Q", "<nop>")

--vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

--Man page Mode
vim.keymap.set("n", "<leader>H", function()
    if vim.w.man_mode == 0 then
        vim.w.man_mode = 1
        vim.w.nutoggle = 0
        vim.opt.nu = false
        vim.opt.relativenumber = false
        vim.opt.colorcolumn = ""
        vim.opt.signcolumn = "no"
        vim.keymap.set("n", "j", "2<C-e>2jzz", { buffer = true })
        vim.keymap.set("n", "k", "2<C-y>2kzz", { buffer = true })
        print("Man Page Mode On")
    elseif vim.w.man_mode == 1 then
        vim.w.man_mode = 0
        vim.w.nutoggle = 1
        vim.opt.nu = true
        vim.opt.relativenumber = true
        vim.opt.colorcolumn = "80"
        vim.keymap.set("n", "j", "j", { buffer = true })
        vim.keymap.set("n", "k", "k", { buffer = true })
        print("Man Page Mode Off")
    end
end)

--statusbar toggle
local statustoggle = 0
vim.keymap.set("n", "<leader>S", function()
    if statustoggle == 0 then
        statustoggle = 1
        vim.opt.ls = 2
        vim.opt.ruler = true
        print("Status Bar On")
    elseif statustoggle == 1 then
        statustoggle = 0
        vim.opt.ls = 0
        vim.opt.ruler = false
        print("Status Bar Off")
    end
end)

--Reload Setting and Keymap
vim.keymap.set("n", "<leader>R", function()
    vim.cmd('luafile $HOME/.config/nvim/lua/yesyesbike/init.lua')
    vim.cmd('luafile $HOME/.config/nvim/lua/yesyesbike/harpoon.lua')
    vim.cmd('luafile $HOME/.config/nvim/lua/yesyesbike/lsp.lua')
    vim.cmd('luafile $HOME/.config/nvim/lua/yesyesbike/plugin.lua')
    vim.cmd('luafile $HOME/.config/nvim/lua/yesyesbike/remap.lua')
    vim.cmd('luafile $HOME/.config/nvim/lua/yesyesbike/set.lua')
    vim.cmd('luafile $HOME/.config/nvim/lua/yesyesbike/telescope.lua')
    vim.cmd('luafile $HOME/.config/nvim/lua/yesyesbike/nvimr.lua')
    vim.cmd('luafile /home/yesyesbike/.config/nvim/lua/yesyesbike/luasnip.lua')

end)

--Redraw Remap because of vim-tmux-navigator
--vim.keymap.set("n", "<leader>l", "<cmd>redraw<CR><cmd>e<CR>")

--Resize Panes
vim.keymap.set({"n", "t"}, "<C-Left>", "<cmd>silent :vertical resize -1<CR>")
vim.keymap.set({"n", "t"}, "<C-Right>", "<cmd>silent :vertical resize +1<CR>")
vim.keymap.set({"n", "t"}, "<C-Up>", "<cmd>silent :resize +1<CR>")
vim.keymap.set({"n", "t"}, "<C-Down>", "<cmd>silent :resize -1<CR>")

--FULLSCREEN
vim.keymap.set("n", "<C-w><Space>", "<C-w>_<C-w>|")


--Terminal
vim.keymap.set("t", "<C-q>", "<C-\\><C-n>")
vim.keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h")
vim.keymap.set("t", "<C-j>", "<C-\\><C-n><C-w>j")
vim.keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k")
vim.keymap.set("t", "<C-l>", "<C-\\><C-n><C-w>l")
vim.keymap.set("n", "<leader>T", "<cmd>silent :11new<CR><cmd>silent :term<CR>")
vim.keymap.set("n", "<leader>vT", "<cmd>silent :57vnew<CR><cmd>silent :term<CR>")

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.w.nutoggle = 1
vim.w.hltoggle = 0
vim.w.cmdtoggle = 0
vim.g.mantoggle = 0

vim.keymap.set({"n", "x"}, "<leader>h", function ()
    if vim.w.nutoggle == 0 then
        vim.w.nutoggle = 1
        vim.opt.number = true
        vim.opt.relativenumber = true
        vim.opt.signcolumn = "number"
        print("set number")
    elseif vim.w.nutoggle == 1 then
        vim.w.nutoggle = 0
        vim.opt.number = false
        vim.opt.relativenumber = false
        vim.opt.signcolumn = "no"
        print("set nonumber")
    end
end)


vim.keymap.set({"n", "x"}, "<leader>H", function ()
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

vim.keymap.set("n", "<leader>C", function ()
    if vim.w.cmdtoggle == 0 then
        vim.w.cmdtoggle = 1
        vim.opt.cmdheight = 1
    elseif vim.w.cmdtoggle == 1 then
        vim.w.cmdtoggle = 0
        vim.opt.cmdheight = 0
    end
end)


--Save my pinky
vim.keymap.set("i", "<C-u>", "<ESC>hgUiwea", { desc = "Make the word before the cursur uppercase" });


vim.keymap.set("x", "J", ":m '>+1<CR>gv=gv", { desc = "Move one line down the selection" })
vim.keymap.set("x", "K", ":m '<-2<CR>gv=gv", { desc = "Move one line up the selection" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "J without moving cursor" })
vim.keymap.set("n", "gJ", "mzgJ`z", { desc = "gJ without moving cursor" })

vim.keymap.set("x", "<leader>p", "\"_dP", { desc = "Paste to selection and keep current register" })

vim.keymap.set("n", "<leader>y", "\"+y", { desc = "yank to clipboard" })
vim.keymap.set("x", "<leader>y", "\"+y", { desc = "yank to clipboard" })
vim.keymap.set("n", "<leader>Y", "\"+y$", { desc = "yank to clipboard" })

vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "save with less keystrokes" })
vim.keymap.set("n", "<CR>q", ":wqa<CR>", { desc = "fast quit" })

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", { desc = "substitute the word under the cursor in a whole file" })

--Reload Setting and Keymap
vim.keymap.set("n", "<leader>R", function()
    vim.cmd("au!")
    vim.cmd('luafile $HOME/.config/nvim/lua/yesyesbike/init.lua')
    vim.cmd('luafile $HOME/.config/nvim/lua/yesyesbike/set.lua')
    vim.cmd('luafile $HOME/.config/nvim/lua/yesyesbike/remap.lua')
    vim.cmd('luafile $HOME/.config/nvim/lua/yesyesbike/plugin.lua')
    vim.cmd('luafile $HOME/.config/nvim/lua/yesyesbike/treesitter.lua')
    vim.cmd('luafile $HOME/.config/nvim/lua/yesyesbike/telescope.lua')
    vim.cmd('luafile $HOME/.config/nvim/lua/yesyesbike/harpoon.lua')
    vim.cmd('luafile $HOME/.config/nvim/lua/yesyesbike/lsp.lua')
    vim.cmd('luafile $HOME/.config/nvim/lua/yesyesbike/luasnip.lua')
    --vim.cmd('luafile $HOME/.config/nvim/lua/yesyesbike/scrolleof.lua')
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

end, { desc = "Reload all setting(In some dumb way)" })

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
vim.keymap.set("t", "<C-j>", "<C-\\><C-n><C-w>j")
vim.keymap.set("n", "<leader>T", "<cmd>11new<CR><cmd>te<CR><cmd>file Terminal<CR>")
vim.keymap.set("n", "<leader>vT", "<cmd>47vnew<CR><cmd>te<CR><cmd>file vTerminal<CR>")


--Run the current buffer in terminal
--fix it lateeeer
vim.keymap.set("n", "<leader>rr", function()
    local filetype = vim.bo.filetype
    if filetype == "c" then
        vim.cmd("!echo % > /tmp/__FILENAME")
        vim.cmd("11new")
        vim.cmd.te("filename=$(cat /tmp/__FILENAME);~/bash/./gcc.sh $filename;exit")
    elseif filetype == "lua" then
        vim.cmd.so()
    elseif filetype == "racket" then
        vim.cmd("!echo % > /tmp/__FILENAME")
        vim.cmd("50vnew")
        vim.cmd.te("filename=$(cat /tmp/__FILENAME);racket")
    else
        vim.cmd("!echo % > /tmp/__FILENAME")
        vim.cmd("11new")
        vim.cmd.te("filename=$(cat /tmp/__FILENAME);./$filename;exit")
    end
end)

--scroll like less in man page
--I didnt unmap my custom d command...
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    group = vim.api.nvim_create_augroup('LessScrollMan', { clear = true }),
    pattern = {"man://*"},
    callback = function ()
        vim.keymap.set("n", "e", "<C-d>zz", { buffer = true })
        vim.keymap.set("n", "u", "<C-u>zz", { buffer = true })
    end
})


--scroll like less in help page
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    group = vim.api.nvim_create_augroup('LessScrollHelp', { clear = true }),
    callback = function ()
        if vim.bo.buftype == 'help' then
            vim.keymap.set("n", "e", "<C-d>zz", { buffer = true })
            vim.keymap.set("n", "u", "<C-u>zz", { buffer = true })
        end
    end
})



--Run the debugger in terminal
vim.keymap.set("n", "<leader>rd", function()
    local filetype = vim.bo.filetype
    if filetype == "c" then
        vim.cmd("!echo % > __FILENAME")
        vim.cmd("160vnew")
        vim.cmd.te("filename=$(cat __FILENAME);~/bash/./gcc.sh $filename -g;rm __FILENAME;exit")
    end
end)


--set filetype with leader key (I'll make it better later with Cofilenut)
vim.keymap.set("n", "<leader>1", function ()
    vim.bo.filetype = 'bash'
    vim.cmd.norm("ashG")
    vim.cmd.write({mods = {silent = true}})
    vim.cmd('silent !chmod u+x %')
    vim.cmd.star()
end)
vim.keymap.set("n", "<leader>2", function ()
    vim.bo.filetype = 'perl'
    vim.cmd.norm("ashG")
    vim.cmd.write({mods = {silent = true}})
    vim.cmd('silent !chmod u+x %')
    vim.cmd.star()
end)

--Cofilenut
--First, I need to learn more about telescope
--vim.keymap.set("n", "<C-f>", "")



--Perl keymapp
vim.keymap.set("n", "vi/", ":set ww+=h,l<CR>/\\/<CR>hvNl:<C-u>set ww-=h,l<CR>gv")
vim.keymap.set("n", "va/", "/\\/<CR>vN")
vim.keymap.set("n", "vi#", ":set ww+=h,l<CR>/#<CR>hvNl:<C-u>set ww-=h,l<CR>gv")
vim.keymap.set("n", "va#", "/#<CR>vN")
vim.keymap.set("n", "vi!", ":set ww+=h,l<CR>/!<CR>hvNl:<C-u>set ww-=h,l<CR>gv")
vim.keymap.set("n", "va!", "/!<CR>vN")
vim.keymap.set("n", "vi~", ":set ww+=h,l<CR>/\\~<CR>hvNl:<C-u>set ww-=h,l<CR>gv")
vim.keymap.set("n", "va~", "/\\~<CR>vN")

vim.keymap.set("n", "ci/", "vi/c", { remap = true })
vim.keymap.set("n", "ca/", "va/c", { remap = true })
vim.keymap.set("n", "ci#", "vi#c", { remap = true })
vim.keymap.set("n", "ca#", "va#c", { remap = true })
vim.keymap.set("n", "ci!", "vi!c", { remap = true })
vim.keymap.set("n", "ca!", "va!c", { remap = true })
vim.keymap.set("n", "ci~", "vi~c", { remap = true })
vim.keymap.set("n", "ca~", "va~c", { remap = true })

vim.keymap.set("n", "di/", "vi/d", { remap = true })
vim.keymap.set("n", "da/", "va/d", { remap = true })
vim.keymap.set("n", "di#", "vi#d", { remap = true })
vim.keymap.set("n", "da#", "va#d", { remap = true })
vim.keymap.set("n", "di!", "vi!d", { remap = true })
vim.keymap.set("n", "da!", "va!d", { remap = true })
vim.keymap.set("n", "di~", "vi~d", { remap = true })
vim.keymap.set("n", "da~", "va~d", { remap = true })

vim.keymap.set("n", "yi/", "vi/y", { remap = true })
vim.keymap.set("n", "ya/", "va/y", { remap = true })
vim.keymap.set("n", "yi#", "vi#y", { remap = true })
vim.keymap.set("n", "ya#", "va#y", { remap = true })
vim.keymap.set("n", "yi!", "vi!y", { remap = true })
vim.keymap.set("n", "ya!", "va!y", { remap = true })
vim.keymap.set("n", "yi~", "vi~y", { remap = true })
vim.keymap.set("n", "ya~", "va~y", { remap = true })

vim.keymap.set("n", "<leader>E", vim.cmd.Ex)

vim.w.nutoggle = 1
vim.w.hltoggle = 0
vim.w.cmdtoggle = 0

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


vim.keymap.set("n", "<C-g>", function ()
    if vim.w.cmdtoggle == 0 then
        vim.w.cmdtoggle = 1
        vim.opt.cmdheight = 1
        vim.opt.ls = 2
        vim.opt.ruler = true
    elseif vim.w.cmdtoggle == 1 then
        vim.w.cmdtoggle = 0
        vim.opt.cmdheight = 0
        vim.opt.ls = 0
        vim.opt.ruler = false
    end
end)


--usless keys...
vim.keymap.set("i", "<Home>", "<nop>")
vim.keymap.set("i", "<PageUp>", "<nop>")
vim.keymap.set("i", "<PageDown>", "<nop>")
vim.keymap.set("i", "<END>", "<nop>")
vim.keymap.set("n", "<Home>", "<nop>")
vim.keymap.set("n", "<PageUp>", "<nop>")
vim.keymap.set("n", "<PageDown>", "<nop>")
vim.keymap.set("n", "<END>", "<nop>")


--Save my pinky
vim.keymap.set("i", "<C-u>", "<ESC>gUiwea",
    { desc = "Make the word before the cursor uppercase" });

--Select all
vim.keymap.set("n", "<leader>A", "maggVG")


--Skill Issue!!!
vim.keymap.set({"n", "x"}, "H", "^")
vim.keymap.set({"n", "x"}, "L", "$")

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

vim.keymap.set("n", "<leader>w", ":w<CR>kj", { desc = "save with less keystrokes" })
vim.keymap.set("n", "<leader>q", ":q<CR>", { desc = "quit with less keystrokes" })
vim.keymap.set("n", "<leader>x", ":!chmod u+x %<CR>", { silent = true })

vim.keymap.set("n", "Q", "gQ")

vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>",
    { desc = "substitute the word under the cursor in a whole file" })

--Reload Setting and Keymap
vim.keymap.set("n", "<leader>R", function()
    vim.cmd("au!")

    local cmdir = 'luafile '..os.getenv('HOME')..'/.config/nvim/lua/yesyesbike/'
    local load = {'init', 'set', 'remap', 'plugin', 'telescope',
                    'harpoon', 'lsp', 'luasnip'}
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
            vim.cmd("!echo % > /tmp/__FILENAME42069")
            vim.cmd("11new")
            vim.cmd.te("filename=$(< /tmp/__FILENAME42069);~/util/gcc $filename;exit")
        end
    elseif filetype == "asm" then
        vim.cmd("!echo % > /tmp/__FILENAME42069")
        vim.cmd("11new")
        vim.cmd.te("~/util/asm")
    --elseif filetype == "lua" then
    --    vim.cmd.so()
    --elseif filetype == "racket" then
    --    vim.cmd("!echo % > /tmp/__FILENAME42069")
    --    vim.cmd("50vnew")
    --    vim.cmd.te("filename=$(< /tmp/__FILENAME42069);racket")
    else
        vim.cmd("!echo % > /tmp/__FILENAME42069")
        vim.cmd("11new")
        vim.cmd.te("filename=$(< /tmp/__FILENAME42069);./$filename;exit")
    end
end)


vim.keymap.set("n", "<leader>m", function ()
    if check_makefile() then
        vim.cmd('make!')
    elseif vim.bo.filetype == "c" then
        vim.cmd('!gcc %')
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

--Setting filetype and shbang
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


--Colorscheme for bright place
vim.keymap.set("n", "<leader>j", function ()
    if vim.g.colors_name ~= 'photon' then
        vim.cmd.colorscheme('photon')
    else
        vim.cmd.colorscheme('yin')
    end
end)

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>E", vim.cmd.Ex)

vim.keymap.set("n", "<leader>w", ":w<cr>")
vim.keymap.set("n", "<leader>q", ":q<cr>")

vim.keymap.set({"n", "v"}, "H", "^")
vim.keymap.set({"n", "v"}, "L", "$")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")

vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<leader>d", "\"_d")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>")

vim.keymap.set("n", "<leader>R", function()
	vim.cmd("so ~/.config/nvim/init.lua")
	vim.cmd("so ~/.config/nvim/lua/yesyesbike/set.lua")
	vim.cmd("so ~/.config/nvim/lua/yesyesbike/remap.lua")
	print("Reloaded")
end)

vim.keymap.set("i", "<C-s>", "<esc>:w<cr>a")



-- Development Remap

vim.keymap.set("n", "<leader>m", function()
	vim.cmd("make!")
end)

vim.keymap.set("n", "<leader>rr", function()
	vim.cmd("silent make! makerun")
end)

vim.keymap.set("n", "<leader>rd", function()
	vim.cmd("silent make! makedbg")
end)


-- 한글
vim.keymap.set("i", "<C-c><C-c>", "<esc>!!han -E $'\\x0c'<cr><C-l>A")
vim.keymap.set("i", "<C-c><C-f>", "<esc>!!han -e $'\\x0c'<cr><C-l>A")
vim.keymap.set("i", "<C-c><C-v>", "<esc>!!han -O $'\\x0c'<cr><C-l>A")
vim.keymap.set("i", "<C-c><C-g>", "<esc>!!han -o $'\\x0c'<cr><C-l>A")

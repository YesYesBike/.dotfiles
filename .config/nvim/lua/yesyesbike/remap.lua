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
	print("Reloaded")
end)


-- Development Remap

vim.keymap.set("n", "<leader>m", function()
	vim.cmd("make!")
end)

vim.keymap.set("n", "<leader>r", function()
	vim.cmd("silent make! makerun")
end)

vim.keymap.set("n", "<leader>d", function()
	vim.cmd("silent make! makedbg")
end)

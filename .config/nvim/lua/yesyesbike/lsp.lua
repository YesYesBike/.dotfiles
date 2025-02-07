vim.api.nvim_create_autocmd('LspAttach', {
	callback = function()
		vim.keymap.set('n', '<leader>ld', '<cmd>lua vim.lsp.buf.definition()<cr>')
		vim.keymap.set('n', '<leader>lD', '<cmd>lua vim.lsp.buf.declaration()<cr>')
		vim.keymap.set('n', '<leader>lr', '<cmd>lua vim.lsp.buf.references()<cr>')
		vim.keymap.set('n', '<leader>lR', '<cmd>lua vim.lsp.buf.rename()<cr>')
		vim.keymap.set('n', '<leader>lc', '<cmd>lua vim.lsp.buf.code_action()<cr>')
		vim.keymap.set('n', '<leader>li', '<cmd>lua vim.lsp.buf.incoming_calls()<cr>')
		vim.keymap.set('n', '<leader>lo', '<cmd>lua vim.lsp.buf.outgoing_calls()<cr>')
		vim.keymap.set('n', '<leader>lI', '<cmd>lua vim.lsp.buf.implementation()<cr>')
		vim.keymap.set('n', '<leader>ls', '<cmd>lua vim.lsp.buf.signature_help()<cr>')
		--vim.keymap.set('i', '<C-j>', '<C-x><C-o>')

		vim.opt.completeopt = "menu"
	end,
})

local ls = require("luasnip")

--vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-K>", function() ls.jump( 1) end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-J>", function() ls.jump(-1) end, {silent = true})

vim.keymap.set({"i", "s"}, "<C-E>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, {silent = true})

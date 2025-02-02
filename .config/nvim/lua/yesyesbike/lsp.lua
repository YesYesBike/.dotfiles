vim.api.nvim_create_autocmd('LspAttach', {
	callback = function()
		vim.keymap.set('n', '<leader>ld', '<cmd>lua vim.lsp.buf.definition()<cr>')
		vim.keymap.set('n', '<leader>ld', '<cmd>lua vim.lsp.buf.definition()<cr>')
		vim.keymap.set('n', '<leader>lr', '<cmd>lua vim.lsp.buf.references()<cr>')
		vim.keymap.set('n', '<leader>lR', '<cmd>lua vim.lsp.buf.rename()<cr>')
		vim.keymap.set('n', '<leader>lc', '<cmd>lua vim.lsp.buf.code_action()<cr>')
		vim.keymap.set('n', '<leader>li', '<cmd>lua vim.lsp.buf.incoming_calls()<cr>')
		vim.keymap.set('n', '<leader>lo', '<cmd>lua vim.lsp.buf.outgoing_calls()<cr>')
		vim.keymap.set('n', '<leader>lI', '<cmd>lua vim.lsp.buf.implementation()<cr>')
		vim.keymap.set('n', '<leader>ls', '<cmd>lua vim.lsp.buf.signature_help()<cr>')

		--vim.opt.formatexpr = nil
		--vim.opt.omnifunc = nil
		vim.opt.tagfunc = nil
		vim.keymap.del('n', 'K', { buffer = true })
	end,
})

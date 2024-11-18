local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>tb', builtin.builtin, {})
vim.keymap.set('n', '<leader>tC', builtin.colorscheme, {})
vim.keymap.set('n', '<leader>tf', builtin.find_files, {})
vim.keymap.set('n', '<leader>tg', builtin.git_files, {})
vim.keymap.set('n', '<leader>th', builtin.help_tags, {})
vim.keymap.set('n', '<leader>tk', builtin.keymaps, {})
vim.keymap.set('n', '<leader>tm', builtin.man_pages, {})
vim.keymap.set('n', '<leader>to', builtin.vim_options, {})
vim.keymap.set('n', '<leader>tt', builtin.tags, {})

vim.keymap.set('n', '<leader>ts', function()
	builtin.grep_string({ search = vim.fn.input("Grep> ") });
end)
vim.keymap.set('n', '<leader>/', function()
	builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
		winblend = 10,
		previewer = false,
	})
end, {})


local telescope = require('telescope')
telescope.setup{
	pickers = {
		keymaps = { show_plug = false, },
		man_pages = { sections = { "1", "1perl", "2", "3p" } },
	}
}

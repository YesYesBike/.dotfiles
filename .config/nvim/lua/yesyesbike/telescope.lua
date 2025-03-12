local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>Tb', builtin.builtin, {})
vim.keymap.set('n', '<leader>Tf', builtin.find_files, {})
vim.keymap.set('n', '<leader>Th', builtin.help_tags, {})
vim.keymap.set('n', '<leader>Tk', builtin.keymaps, {})
vim.keymap.set('n', '<leader>Tm', builtin.man_pages, {})
vim.keymap.set('n', '<leader>Tt', builtin.tags, {})

vim.keymap.set('n', '<leader>Ts', function()
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
	defaults = {
		layout_config = {
          bottom_pane = {
            height = 0.999,
            preview_cutoff = 120,
            prompt_position = "top"
          },
          center = {
            height = 0.999,
            preview_cutoff = 40,
            prompt_position = "top",
            width = 0.999
          },
          cursor = {
            height = 0.999,
            preview_cutoff = 40,
            width = 0.999
          },
          horizontal = {
            height = 0.999,
            preview_cutoff = 120,
            prompt_position = "bottom",
            width = 0.999
          },
          vertical = {
            height = 0.999,
            preview_cutoff = 40,
            prompt_position = "bottom",
            width = 0.999
          }
		},
	},
	pickers = {
		keymaps = { show_plug = false, },
		man_pages = { sections = { "1", "1perl", "2", "3p" } },
	},
}

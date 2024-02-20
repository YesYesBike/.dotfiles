local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>tb', builtin.builtin, {})
vim.keymap.set('n', '<leader>tB', builtin.buffers, {})
vim.keymap.set('n', '<leader>tC', builtin.colorscheme, {})
vim.keymap.set('n', '<leader>tf', builtin.find_files, {})
vim.keymap.set('n', '<leader>tg', builtin.git_files, {})
vim.keymap.set('n', '<leader>th', builtin.help_tags, {})
vim.keymap.set('n', '<leader>tk', builtin.keymaps, {})
vim.keymap.set('n', '<leader>tm', builtin.man_pages, {})
vim.keymap.set('n', '<leader>tr', builtin.registers, {})
vim.keymap.set('n', '<leader>ts', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)


--local actions = require("telescope.actions")
local telescope = require('telescope')
telescope.setup{
    pickers = {
        find_files = {
            hidden = true
        }
    }
}

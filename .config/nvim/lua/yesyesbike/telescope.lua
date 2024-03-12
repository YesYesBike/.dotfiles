local builtin = require('telescope.builtin')
--vim.keymap.set('n', '<leader>ta', builtin.autocommands, {})
vim.keymap.set('n', '<leader>tb', builtin.builtin, {})
vim.keymap.set('n', '<leader>tB', builtin.buffers, {})
vim.keymap.set('n', '<leader>tC', builtin.colorscheme, {})
vim.keymap.set('n', '<leader>tf', builtin.find_files, {})
vim.keymap.set('n', '<leader>tF', builtin.current_buffer_fuzzy_find, {})
vim.keymap.set('n', '<leader>tg', builtin.git_files, {})
vim.keymap.set('n', '<leader>th', builtin.help_tags, {})
vim.keymap.set('n', '<leader>tj', builtin.jumplist, {})
vim.keymap.set('n', '<leader>tk', builtin.keymaps, {})
vim.keymap.set('n', '<leader>tm', builtin.man_pages, {})
vim.keymap.set('n', '<leader>to', builtin.vim_options, {})
vim.keymap.set('n', '<leader>tO', builtin.oldfiles, {})
vim.keymap.set('n', '<leader>tP', builtin.planets, {})
vim.keymap.set('n', '<leader>tr', builtin.registers, {})
vim.keymap.set('n', '<leader>ts', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
vim.keymap.set('n', '<leader>tt', builtin.resume, {})
vim.keymap.set('n', '<leader>/', function()
    builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
    })
end, {})



--local actions = require("telescope.actions")
local telescope = require('telescope')
telescope.setup{
    pickers = {
        find_files = {
            hidden = true
        },
        planets = {
            show_pluto = true,
            show_moon = true,
        },
        keymaps = {
            show_plug = false,
        },
        man_pages = {
            sections = { "1", "1perl" },
        }
    }
}

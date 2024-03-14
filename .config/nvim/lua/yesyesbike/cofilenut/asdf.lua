local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"
local themes = require('telescope.themes')

local cofilenut = function (opts)
    opts = opts or {
    }
    pickers.new(opts, {
        prompt_title = "Cofilenut",
        finder = finders.new_table {
            results = {
                { "red", "#ff0000" },
                { "green", "#00ff00" },
                { "blue", "#0000ff" },
            },
            entry_maker = function(entry)
                return {
                    value = entry,
                    display = entry[1],
                    ordinal = entry[1],
                }
            end
        },
        sorter = conf.generic_sorter(opts),
        attach_mappings = function (prompt_bufnr, map)
            actions.select_default:replace(function ()
                actions.close(prompt_bufnr)
                local selction = action_state.get_selected_entry()
                vim.api.nvim_put({ selction[1] }, "", false, true)
            end)
            return true
        end,
    }):find()
end

cofilenut(themes.get_dropdown{})

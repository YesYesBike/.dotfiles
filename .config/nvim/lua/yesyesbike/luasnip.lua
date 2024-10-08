local ls = require("luasnip")

require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/snippets"})

ls.setup({
    keep_roots = true,
	link_roots = true,
	link_children = true,
	update_events = {"TextChanged", "TextChangedI"},
    enable_autosnippets = true,
    delete_check_events = "TextChanged",
    ext_opts = {},
})

vim.keymap.set({"i","s"}, "<C-l>", function ()
    if ls.expand_or_jumpable() then
       ls.expand_or_jump()
    end
end, {silent = true})

vim.keymap.set({"i","s"}, "<C-h>", function ()
    if ls.jumpable(-1) then
       ls.jump(-1)
    end
end, {silent = true})

vim.keymap.set({"i","s"}, "<c-k>", function ()
    if ls.choice_active() then
       ls.change_choice(1)
    end
end, {silent = true})

vim.keymap.set({"i","s"}, "<c-j>", function ()
    if ls.choice_active() then
       ls.change_choice(-1)
    end
end, {silent = true})

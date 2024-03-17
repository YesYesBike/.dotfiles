--Boilerplate
local ls = require("luasnip")
local s = ls.snippet
--local sn = ls.snippet_node
--local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
--local r = ls.restore_node
--local events = require("luasnip.util.events")
--local ai = require("luasnip.nodes.absolute_indexer")
local extras = require("luasnip.extras")
--local l = extras.lambda
local rep = extras.rep
--local p = extras.partial
--local m = extras.match
--local n = extras.nonempty
--local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
--local fmta = require("luasnip.extras.fmt").fmta
--local conds = require("luasnip.extras.expand_conditions")
--local postfix = require("luasnip.extras.postfix").postfix
--local types = require("luasnip.util.types")
--local parse = require("luasnip.util.parser").parse_snippet
--local ms = ls.multi_snippet
--local k = require("luasnip.nodes.key_indexer").new_key

local snippets, autosnippets = {}, {}












--Meta-snippets

local LuasnipTempLegacy = s("LuasnipTempLegacy", {
    t("local "), i(1, "SnippetName"),
    t(' = s("'), i(2, "trig"), t('", {'),
    t({"" , "\t"}), i(3, "--INSERT"),
    t({"" , "})"}),
    t({"" , "table.insert(snippets, "}), rep(1), t(")"),
})
table.insert(snippets, LuasnipTempLegacy)


local LuasnipTemp = s("LuasnipTemp", {
    t("local "), i(1, "SnippetName"),
    t(' = s({ trig = "'), i(2, "trig"),
    t('", regTrig = "'), c(3, {t("true"), t("false")}),
    t('", hidden = "'), c(4, {t("false"), t("true")}),
    t('" },'),
    t({"", 'fmt([['}),
    t({"" , "\t"}), i(7, "--INSERT"),
    t({"", "]], {"}),
    t({"", "\t"}), i(8, "--*insert_node*"),
    t({"", ""}), t("}, {"),
    t({"", "\t"}), t('delimiters = "'),
    c(5, {t'{}', t'<>', t'[]', t'()'}),
    t('",'),
    t({"", "\t"}), i(9, '--Other Options'),
    t({"" , "}))"}),
    t({"" , "table.insert("}), c(6,
        {t("snippets"), t("autosnippets")}
    ), t(", "), rep(1), t(")"),
})
table.insert(snippets, LuasnipTemp)


local LuasnipBoilerplate = s("LuasnipBoilerplate", fmt(
    [[
local ls = require("luasnip")
local s = ls.snippet
--local sn = ls.snippet_node
--local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
--local r = ls.restore_node
--local events = require("luasnip.util.events")
--local ai = require("luasnip.nodes.absolute_indexer")
local extras = require("luasnip.extras")
--local l = extras.lambda
local rep = extras.rep
--local p = extras.partial
--local m = extras.match
--local n = extras.nonempty
--local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
--local fmta = require("luasnip.extras.fmt").fmta
--local conds = require("luasnip.extras.expand_conditions")
--local postfix = require("luasnip.extras.postfix").postfix
--local types = require("luasnip.util.types")
--local parse = require("luasnip.util.parser").parse_snippet
--local ms = ls.multi_snippet
--local k = require("luasnip.nodes.key_indexer").new_key

local snippets, autosnippets = {}, {}

<>

return snippets, autosnippets
    ]], {i(1, "INSERT")}, { delimiters = "<>" })
)
table.insert(snippets, LuasnipBoilerplate)






--Normal Snippets
local VimKeymapSet = s({ trig = "vks", name = "VimKeymapSet", desc = "", hidden = true, }, fmt([[
    vim.keymap.set("{}", "{}", {})
    ]], {i(1, "mode"), i(2, "Key"),
        c(3, { {t'"', i(1, 'Function'), t'"' }, i(1, 'Function'), }),
    })
)
table.insert(snippets, VimKeymapSet)


--Return the value
return snippets, autosnippets

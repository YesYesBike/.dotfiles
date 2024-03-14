local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local extras = require("luasnip.extras")
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet
local ms = ls.multi_snippet
local k = require("luasnip.nodes.key_indexer").new_key

local snippets, autosnippets = {}, {}

local LuasnipTemp01 = s("LuasnipTemp01", {
    t("local "), i(1, "SnippetName"),
    t(' = s("'), i(2, "string"), t('", {'),
    t({"" , "\t"}), i(3, "--INSERT"),
    t({"" , "})"}),
    t({"" , "table.insert(snippets, "}), rep(1), t(")"),
})
table.insert(snippets, LuasnipTemp01)

local LuasnipTemp02 = s("LuasnipTemp02", {
    t("local "), i(1, "SnippetName"),
    t(' = s("'), i(2, "string"), t('", fmt('),
    t({"", "\t[["}),
    t({"" , "\t"}), i(3, "--INSERT"),
    t({"", "\t]], {"}), i(4, "(insert_node)"), t("})"),
    t({"" , ")"}),
    t({"" , "table.insert(snippets, "}), rep(1), t(")"),
})
table.insert(snippets, LuasnipTemp02)

local LuasnipBoilerplate = s("LuasnipBoilerplate", fmt(
    [[
local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local extras = require("luasnip.extras")
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet
local ms = ls.multi_snippet
local k = require("luasnip.nodes.key_indexer").new_key

local snippets, autosnippets = {}, {}

<>

return snippets, autosnippets
    ]], {i(1, "INSERT")}, { delimiters = "<>" })
)
table.insert(snippets, LuasnipBoilerplate)

local VimKeymapSet = s({ trig = "vks", name = "VimKeymapSet", desc = ""}, fmt(
    [[
    vim.keymap.set("{}", "{}", "{}")
    ]], {i(1), i(2), i(3)
    })
)
table.insert(snippets, VimKeymapSet)

return snippets, autosnippets

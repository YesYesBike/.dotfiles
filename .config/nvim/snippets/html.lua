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

local doctype = s("doc", {
    t("<!DOCTYPE html>"),
    t({"", "<html>"}),
    t({"", "\t<head>"}),
    t({"", '\t\t<meta charset="utf-8">'}),
    t({"", "\t\t\t<title>"}),
    t({"", "\t\t\t\t"}), i(1,"TITLE"),
    t({"", "\t\t</title>"}),
    t({"", "\t</head>"}),
    t({"", ""}),
    t({"", "\t<body>"}),
    t({"", "\t\t"}), i(2,"BODY"),
    t({"", "\t</body>"}),
    t({"", "</html>"}),
})
table.insert(snippets, doctype)

return snippets, autosnippets

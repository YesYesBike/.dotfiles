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








local shbang = s({trig = "sh", hidden = "true" }, fmt([[
#!/bin/perl
use utf8;
use strict;
use warnings;
use diagnostics;
use feature qw/
    say{}
/;

{}
]], {i(1), i(2)})
)
table.insert(snippets, shbang)


local my_var = s({ trig = "m", regTrig = "true", hidden = "false" },
fmt([[
    {}{}{}{};
]], {
    c(1, {t"", t"my ", t"our "}),
    c(2, {t"$", t"@", t"%"}),
    i(3, "NAME"),
    c(4, {
        {
            t" = ",
            i(1, "EXPRESSION"),
        },
        t"",
    }),
}, {
    delimiters = "{}",
    --Other Options
}))
table.insert(snippets, my_var)


local q_bracket = s({ trig = "Q", regTrig = "true", hidden = "true" },
fmt([[
    {}{}{}{}{}
]], {
    c(1, {t"q", t"qq", t"qw", t"qx", }),
    c(2, {t"/", t"#", t"*", t"'", t'"', t"~" }),
    --c(2, {t"/", t"[", t"{", t"(", t"<", t"#", t"*", }),
    i(3, " Something "),
    f(function (arg)
        return arg[1]
    end, 2),
    c(4, {t";", t"", }),
}, {
    delimiters = "{}",
    --Other Options
}))
table.insert(snippets, q_bracket)


local subroutine = s({ trig = "sub", regTrig = "true", hidden = "true" },
fmt([[
    sub <>{
        <>
    }
]], {
    i(1, "NAME"),
    i(2, "#Function"),
}, {
    delimiters = "<>",
    --Other Options
}))
table.insert(snippets, subroutine)







return snippets, autosnippets

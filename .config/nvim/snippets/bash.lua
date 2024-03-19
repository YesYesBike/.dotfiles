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







local shbang = s({ trig = "sh", regTrig = "true", hidden = "true" },
fmt([[
    #!/bin/bash

    {}
]], {
    i(1),
}, {
    delimiters = "{}",
    --Other Options
}))
table.insert(snippets, shbang)


local for_snippet = s({ trig = "f", regTrig = "true", hidden = "true" },
fmt([[
    for {} in {}
    do
        {}
    done
]], {
    i(1, "var"), i(2, "$something"), i(3, "#something"),
}, {
    delimiters = "{}",
    --Other Options
}))
table.insert(snippets, for_snippet)


local for_snippet2 = s({ trig = "ff", regTrig = "true", hidden = "true" },
fmt([[
    for (( {} ))
    do
        {}
    done
]], {
    i(1, "cond"), i(2, "#something"),
}, {
    delimiters = "{}",
    --Other Options
}))
table.insert(snippets, for_snippet2)


local while_snippet = s({ trig = "w", regTrig = "true", hidden = "true" },
fmt([[
    while {}
    do
        {}
    done
]], {
    i(1, "cond"), i(2, "something"),
}, {
    delimiters = "{}",
    --Other Options
}))
table.insert(snippets, while_snippet)


local until_snippet = s({ trig = "u", regTrig = "true", hidden = "true" },
fmt([[
    until {}
    do
        {}
    done
]], {
    i(1, "cond"), i(2, "something"),
}, {
    delimiters = "{}",
    --Other Options
}))
table.insert(snippets, until_snippet)


local if_snippet = s({ trig = "i", regTrig = "true", hidden = "true" },
fmt([[
    if {}
    then
        {}
    fi
]], {
    i(1, "cond"), i(2, "#something"),
}, {
    delimiters = "{}",
    --Other Options
}))
table.insert(snippets, if_snippet)




local case_snippet = s({ trig = "ca", regTrig = "true", hidden = "true" },
fmt([[
    case {} in
        {})
            {}
            ;;
        {}
    esac
]], {
    i(1, "$var"), i(2, "cond"), i(3, "something"), i(4),
}, {
    delimiters = "{}",
    --Other Options
}))
table.insert(snippets, case_snippet)


local cond = s({ trig = "c", regTrig = "true", hidden = "true" },
fmt([[
    {})
        {}
        ;;
    {}
]], {
    i(1, "cond"), i(2, "#something"), i(3),
}, {
    delimiters = "{}",
    --Other Options
}))
table.insert(snippets, cond)


local function_snippet = s({ trig = "fu", regTrig = "true", hidden = "true" },
fmt([[
    function <>{
        <>
    }
]], {
    i(1, 'name'), i(2, '#something'),
}, {
    delimiters = "<>",
    --Other Options
}))
table.insert(snippets, function_snippet)





return snippets, autosnippets

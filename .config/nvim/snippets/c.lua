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










local include_something = s({ trig = "i", regTrig = "true", hidden = "true" },{
    t'#include ', c(1, { {t'<', i(1, "something"), t'>' },
        {t'"', i(1, "something"), t'"'},
    }),
})
table.insert(snippets, include_something)


local define_something = s({ trig = "d", regTrig = "true", hidden = "true" },{
    t'#define ', i(1, 'FOO'), t' ', i(2, 'bar')
})
table.insert(snippets, define_something)


local for_snippet = s({ trig = "f", regTrig = "true", hidden = "true" },
fmt([[
    for (<>; <>; <>)
]], {
    i(1, 'def'), i(2, 'cond'), i(3, 'inc'),
}, {
    delimiters = "<>",
    --Other Options
}))
table.insert(snippets, for_snippet)


local SnippetName = s({ trig = "([ivdfl])f", regTrig = "true", hidden = "true" },{
    f(function (_,snip)
        if (snip.captures[1]) then
            local word = {
                ['i'] = 'int ',
                ['v'] = 'void ',
                ['d'] = 'double ',
                ['f'] = 'float ',
                ['l'] = 'long ',
            }
            return word[snip.captures[1]]
        end
    end), i(1, 'name'), t'(', i(2, 'void'), t')',
})
table.insert(snippets, SnippetName)


local printf = s({ trig = "pf", regTrig = "true", hidden = "true" },
fmt([[
    printf(<>);
]], {
    i(1, 'something')
}, {
    delimiters = "<>",
    --Other Options
}))
table.insert(snippets, printf)





return snippets, autosnippets

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










local include_something = s({ trig = "^i", regTrig = "true", hidden = "true" },{
    t'#include ', c(1, { {t'<', i(1, "something"), t'>' },
        {t'"', i(1, "something"), t'"'},
    }),
})
table.insert(snippets, include_something)


local define_something = s({ trig = "^d", regTrig = "true", hidden = "true" },{
    t'#define ', i(1, 'FOO'), t' ', i(2, 'bar')
})
table.insert(snippets, define_something)


local for_snippet = s({ trig = "%sf", regTrig = "true", hidden = "true" },{
    t' for(', i(1, "def"), t'; ', i(2, "cond"), t'; ', i(3, "inc"), t')',
})
table.insert(snippets, for_snippet)


local SnippetName = s({ trig = "^([civdfl])(p?)f", regTrig = "true", hidden = "true" },{
    f(function (_,snip)
        if (snip.captures[1]) then
            local word = {
                ['c'] = 'char ',
                ['i'] = 'int ',
                ['v'] = 'void ',
                ['d'] = 'double ',
                ['f'] = 'float ',
                ['l'] = 'long ',
            }
            return word[snip.captures[1]]
        end
    end),
    f(function (_,snip)
        if (snip.captures[2]) then
            local word = {
                ['p'] = '* ',
            }
            return word[snip.captures[2]]
        end
    end),
    c(1, { i(1, 'name'), t'main', }),
    t'(',
    c(2, { i(1, 'void'),
        t'int argc, char *argv[]', }),
    t')',
    c(3, {
        { t'{', t({"","\t"}), i(1, "//something"), t({'','}'}) },
        t';',
    }),
})
table.insert(snippets, SnippetName)


local printf = s({ trig = "%spf", regTrig = "true", hidden = "true" },{
    t' printf("', i(1, "something"), t'"',
    c(2, {
        t(''),
        { t(', '), i(1, 'something') },
    }), t');',
})
table.insert(snippets, printf)


local scanf = s({ trig = "%ssf", regTrig = "true", hidden = "true" },{
    t' scanf("', i(1, "foo"), t'"',
    t(', '), i(2, 'bar'), t');',
})
table.insert(snippets, scanf)


local return_snippet = s({ trig = "re", regTrig = "false", hidden = "true" },{
    t'return ', i(1, 'foo'), t';'
})
table.insert(snippets, return_snippet)



return snippets, autosnippets

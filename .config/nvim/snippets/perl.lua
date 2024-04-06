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
use Data::Dumper;
use feature qw/
    say
/;

{}
]], {i(1)})
)
table.insert(snippets, shbang)





local q_bracket = s({ trig = "([mq])([qwxm]?)([^%P$%%&;])", regTrig = "true", hidden = "true" },
{
    f(function (_,snip)
        return snip.captures[1]
    end),
    f(function (_,snip)
        return snip.captures[2]
    end),
    f(function (_,snip)
        local fix_opposite_bracket = {
            [')'] = '(',
            ['}'] = '{',
            [']'] = '[',
            ['>'] = '<',
        }
        local pair = fix_opposite_bracket[snip.captures[3]]
        if(pair) then
            return pair
        else
            return snip.captures[3]
        end
    end),
    i(1, "something"),
    f(function (_,snip)
        local match_bracket = {
            ['('] = ')',
            ['{'] = '}',
            ['['] = ']',
            ['<'] = '>',
        }
        local pair = match_bracket[snip.captures[3]]
        if(pair) then
            return pair
        else
            return snip.captures[3]
        end
    end)
})
table.insert(autosnippets, q_bracket)


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


local foreach = s({ trig = "f", regTrig = "true", hidden = "true" },
fmt([[
    for <>(<>)
]], {
    i(1),
    c(2,
        {
            i(1, "something"),
            { t"@", i(1, "something") },
            t"@_",
        }
    ),
}, {
    delimiters = "<>",
    --Other Options
}))
table.insert(snippets, foreach)


local STD = s({ trig = "(<?)[sS]", regTrig = "true", hidden = "true" }, {
    f(function (_,snip)
        if snip.captures[1] == '<' then
            return '<'
        end
    end),
    c(1, { t"STDIN", t"STDOUT", t"STDERR", }),
    f(function (_,snip)
        if snip.captures[1] == '<' then
            return '>'
        end
    end),
})
table.insert(snippets, STD)


local big_arrow = s({ trig = "ba", regTrig = "true", hidden = "true" },
fmt([[
    {} => {},
]], {
    i(1, "KEY"), i(2, "'value'"),
}, {
    delimiters = "{}",
    --Other Options
}))
table.insert(snippets, big_arrow)


local backslash_char = s({ trig = "\\([gp]{)", regTrig = "true", hidden = "true" },
{
    t"\\",
    f(function (_,snip)
        return snip.captures[1]
    end),
    t"{", i(1, 'something'), t"}",
})
table.insert(autosnippets, backslash_char)


local dollar_brace = s({ trig = "$([^%s)]*){", regTrig = "true", hidden = "true" },{
    t'$', f(function (_,snip)
        return snip.captures[1]
    end), t'{',
    i(1, 'something'), t'}',
})
table.insert(autosnippets, dollar_brace)


local array_hash_brace = s({ trig = "([@%%]){", regTrig = "true", hidden = "true" },{
    f(function (_,snip)
        return snip.captures[1]
    end), t'{',
    i(1, 'something'), t'}',
})
table.insert(autosnippets, array_hash_brace)


return snippets, autosnippets
